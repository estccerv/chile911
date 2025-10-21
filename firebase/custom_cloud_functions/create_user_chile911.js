const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { parsePhoneNumberFromString } = require("libphonenumber-js");

// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.createUserChile911 = functions.https.onCall(async (data, context) => {
  // 1. Inicializar servicios de Firebase
  const auth = admin.auth();
  const db = admin.firestore();

  try {
    // 2. Extraer y validar parámetros de la solicitud
    const {
      email,
      password, // Permitir que la contraseña sea enviada desde el cliente
      displayName,
      photoUrl,
      phoneNumber,
      identityDocument, // Objeto: { type: 'dni', number: '123' }
      platformRol, // 'citizen', 'institution_operator', 'institution_admin'
      institutionRefId, // ID del documento de la institución si el rol es institucional
    } = data;

    // Validaciones básicas
    if (!email || !displayName || !platformRol) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Faltan campos obligatorios: email, displayName y platformRol.",
      );
    }

    // Si el rol es institucional, el ID de la institución es obligatorio
    if (
      (platformRol === "institution_operator" ||
        platformRol === "institution_admin") &&
      !institutionRefId
    ) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Para roles institucionales, se requiere un ID de institución (institutionRefId).",
      );
    }

    // Si es un ciudadano, la contraseña es obligatoria
    if (platformRol === "citizen" && !password) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "La contraseña es obligatoria para el registro de ciudadanos.",
      );
    }

    // 3. Generar contraseña si no se proporciona (útil para usuarios institucionales)
    const finalPassword = password || Math.random().toString(36).slice(-8);

    // 4. Validar y formatear número de teléfono (asumiendo Chile por defecto)
    let formattedPhoneNumber = null;
    if (phoneNumber) {
      const parsedNumber = parsePhoneNumberFromString(phoneNumber, "CL");
      if (parsedNumber && parsedNumber.isValid()) {
        formattedPhoneNumber = parsedNumber.number; // Formato E.164
      } else {
        // Opcional: puedes lanzar un error si el número es inválido
        console.warn(
          `Número de teléfono inválido proporcionado: ${phoneNumber}`,
        );
      }
    }

    // 5. Crear usuario en Firebase Authentication
    const userRecord = await auth.createUser({
      email,
      password: finalPassword,
      displayName: displayName,
      photoURL: photoUrl || "",
      phoneNumber: formattedPhoneNumber || undefined,
    });

    // 6. Preparar datos para Firestore
    const userData = {
      email,
      displayName,
      uid: userRecord.uid,
      photoUrl: photoUrl || "",
      phoneNumber: formattedPhoneNumber || "",
      identityDocument: identityDocument || {}, // Guardar el objeto o un objeto vacío
      createdTime: admin.firestore.FieldValue.serverTimestamp(),
      platformRol: platformRol, // Rol definido
      status: "active", // Estado por defecto
      lastOnline: admin.firestore.FieldValue.serverTimestamp(),
      isOnline: false,
    };

    // Si es un usuario institucional, añadir la referencia a la institución
    if (institutionRefId) {
      userData.institutionRef = db
        .collection("Institutions")
        .doc(institutionRefId);
    }

    // 7. Guardar usuario en la colección "Users" de Firestore
    await db.collection("Users").doc(userRecord.uid).set(userData);

    console.log(
      `Usuario '${email}' con rol '${platformRol}' creado exitosamente.`,
    );

    // 8. Devolver respuesta exitosa
    // Para usuarios institucionales, es crucial devolver la contraseña generada
    return {
      success: true,
      userId: userRecord.uid,
      generatedPassword: password ? null : finalPassword, // Devuelve la contraseña solo si fue generada
      message: "Usuario creado exitosamente.",
    };
  } catch (error) {
    console.error("Error al crear usuario:", error);

    // Manejo de errores comunes
    if (error.code === "auth/email-already-exists") {
      throw new functions.https.HttpsError(
        "already-exists",
        "El correo electrónico ya está registrado.",
      );
    }
    if (error.code === "invalid-argument") {
      throw error; // Re-lanzar el error de validación
    }

    throw new functions.https.HttpsError(
      "unknown",
      "Ocurrió un error inesperado al crear el usuario.",
    );
  }
});
