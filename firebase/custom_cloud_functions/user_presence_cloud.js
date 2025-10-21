const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

const firestore = admin.firestore();

exports.userPresenceCloud = functions.database
  .ref("/users/{uid}/connections")
  .onWrite(async (change, context) => {
    const connections = change.after.val();
    const userId = context.params.uid;

    // 1. Calcular número de conexiones
    const isConnectionsObject =
      connections !== null && typeof connections === "object";
    const numConnections = isConnectionsObject
      ? Object.keys(connections).length
      : 0;

    // 2. Determinar estado online
    const isOnline = numConnections > 0;

    // 3. Actualizar Firestore
    try {
      await firestore.doc(`users/${userId}`).update({
        isOnline: isOnline,
        lastOnline: isOnline
          ? null
          : admin.firestore.FieldValue.serverTimestamp(),
      });
      const status = isOnline ? "🟢 online" : "🔴 offline";
      console.log(
        `✔️ Usuario ${userId} actualizado: ${status}, Conexiones activas: ${numConnections}`,
      );
    } catch (error) {
      console.error(`❌ Error en usuario ${userId}:`, error);
    }
  });
