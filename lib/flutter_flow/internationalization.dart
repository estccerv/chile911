import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Entry
  {
    'xakuk0u3': {
      'es': 'Chile911',
      'en': 'Chile911',
    },
    '7czbz2en': {
      'es': 'Continuar',
      'en': 'Continue',
    },
    '76gtx384': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Onboard
  {
    '40oit8u6': {
      'es': 'Registro de Usuario',
      'en': 'User Registration',
    },
    'mrdf0u29': {
      'es': 'Datos Personales',
      'en': 'Personal Data',
    },
    'p46f13iq': {
      'es': 'Nombre Completo',
      'en': 'Full Name',
    },
    'nzh5u2gk': {
      'es': 'Ingrese su nombre completo',
      'en': 'Enter your full name',
    },
    '8vontsy1': {
      'es': 'Número Documento Identidad',
      'en': 'Identity Document Number',
    },
    's3cwiul3': {
      'es': 'Ingrese su número de documento',
      'en': 'Enter your document number',
    },
    'd2ac59o8': {
      'es': 'Foto documento identidad',
      'en': 'Photo ID document',
    },
    'txldddjy': {
      'es': 'Adjuntar Foto',
      'en': 'Attach Photo',
    },
    'jvjxjfkp': {
      'es': 'Ver Foto',
      'en': 'See Photo',
    },
    'qurlff3x': {
      'es': 'Tipo de sangre',
      'en': 'Gender',
    },
    'prlk28ar': {
      'es': 'Select...',
      'en': 'Select...',
    },
    'erenhpcs': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'n8svh4c5': {
      'es': 'A+',
      'en': 'Male',
    },
    'ezec8b4x': {
      'es': 'A-',
      'en': 'Female',
    },
    'v17r8a7s': {
      'es': 'B+',
      'en': 'Other',
    },
    'h3xsmard': {
      'es': 'B-',
      'en': 'B-',
    },
    'pmj0q5rl': {
      'es': 'AB+',
      'en': 'AB+',
    },
    'k6bp1ou1': {
      'es': 'AB-',
      'en': 'AB-',
    },
    'u865jc1p': {
      'es': 'O+',
      'en': 'O+',
    },
    'q53xsidh': {
      'es': 'O-',
      'en': 'O-',
    },
    'g80b8q8c': {
      'es': 'Desconocido',
      'en': 'A stranger',
    },
    'uxgi4xvu': {
      'es': 'Género',
      'en': 'Gender',
    },
    '9imoknte': {
      'es': 'Select...',
      'en': 'Select...',
    },
    '81cw02iw': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'uq467wuc': {
      'es': 'Masculino',
      'en': 'Male',
    },
    'zbjyra2r': {
      'es': 'Femenino',
      'en': 'Female',
    },
    'plv3jt6r': {
      'es': 'Otro',
      'en': 'Other',
    },
    'yoxyj643': {
      'es': 'Fecha de nacimiento',
      'en': 'Birthdate',
    },
    'f7bep5gm': {
      'es': 'Teléfono',
      'en': 'Phone',
    },
    '43l4fjqs': {
      'es': 'Dirección',
      'en': 'Address',
    },
    '3ydsn8m1': {
      'es': 'Elegir Direccion',
      'en': 'Choose Direction',
    },
    'nzq1hrxd': {
      'es': 'Descripcion de Direccion ',
      'en': 'Address Description',
    },
    'l7yv0gjd': {
      'es': 'DEPARTAMENTO/HOTEL/AIRBNB/PARIENTE',
      'en': 'APARTMENT/HOTEL/AIRBNB/RELATIVE',
    },
    '9nmwsi2d': {
      'es': 'Contacto de Emergencia',
      'en': 'Emergency Contact',
    },
    'hddf8agn': {
      'es': 'Nombre',
      'en': 'Name',
    },
    'ndny7dtt': {
      'es': 'Ingrese nombre de contacto',
      'en': 'Enter contact name',
    },
    'hhtqrh9l': {
      'es': 'Relacion',
      'en': 'Select...',
    },
    'z0biwwxx': {
      'es': 'Search...',
      'en': 'Search...',
    },
    '6oaehoax': {
      'es': 'Familia',
      'en': 'Male',
    },
    'ymjjg7no': {
      'es': 'Amigo',
      'en': 'Female',
    },
    'yc43ws4b': {
      'es': 'Pareja',
      'en': 'Other',
    },
    'xsj6ju3r': {
      'es': 'Email',
      'en': 'E-mail',
    },
    '3iq51zuv': {
      'es': 'Ingrese email de contacto',
      'en': 'Enter contact email',
    },
    'jpnsxo54': {
      'es': 'Información Médica',
      'en': 'Medical Information',
    },
    'e6mfbwt9': {
      'es': '¿Posee algún tipo de discapacidad?',
      'en': 'Do you have any type of disability?',
    },
    'gh48xzo7': {
      'es': 'Discapacidades',
      'en': 'Disabilities',
    },
    'i0ysqp8m': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'osvylmwn': {
      'es': 'Auditiva',
      'en': 'Hearing',
    },
    'dnc8tysm': {
      'es': 'Visual',
      'en': 'Visual',
    },
    'yph38suc': {
      'es': 'Física',
      'en': 'Physics',
    },
    'o9xdmz7o': {
      'es': 'Intelectual',
      'en': 'Intellectual',
    },
    'kmkpc1os': {
      'es': 'Lenguaje',
      'en': 'Language',
    },
    'sitnucik': {
      'es': 'Psicosocial',
      'en': 'Psychosocial',
    },
    'p1ajm2s6': {
      'es': '¿Tiene algún tipo de alergias?',
      'en': 'Do you have any allergies?',
    },
    'b8hnygyy': {
      'es': 'Alergias',
      'en': 'Allergies',
    },
    's474fjq8': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'uzcgiq5v': {
      'es': 'Comida',
      'en': 'Meal',
    },
    'nk1rp0q8': {
      'es': 'Medicina',
      'en': 'Medicine',
    },
    'oj6r6d0y': {
      'es': 'Animal',
      'en': 'Animal',
    },
    'a5rmvs33': {
      'es': 'Latex',
      'en': 'Latex',
    },
    'l4ow6rzf': {
      'es': 'Polen',
      'en': 'Pollen',
    },
    'ta58id2i': {
      'es': 'Otro',
      'en': 'Other',
    },
    'm7hkx13p': {
      'es': '¿Sufre alguna enfermedad?',
      'en': 'Do you suffer from any illness?',
    },
    '8ju4kyjm': {
      'es': 'Agregar Condicion Medica',
      'en': 'Add Medical Condition',
    },
    'c75jrjku': {
      'es': '¿Consume algún tipo de medicamento?',
      'en': 'Do you take any medication?',
    },
    'qtc5oq45': {
      'es': 'Agregar Medicamento',
      'en': 'Add Medication',
    },
    'y85xyo38': {
      'es': 'Registar Usuario',
      'en': 'Register User',
    },
    'gudtir9h': {
      'es': 'Nombre Completo is required',
      'en': 'Full Name is required',
    },
    'n8gqdl9k': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'r6vdx8lg': {
      'es': 'Número Documento Identidad is required',
      'en': 'Identity Document Number is required',
    },
    'o0sof17e': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'r0bj2lqi': {
      'es': 'title is required',
      'en': 'title is required',
    },
    'iev2j8kr': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '0l4ipo0h': {
      'es': 'dialCode is required',
      'en': 'dialCode is required',
    },
    'moh54sk9': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'g9o57g05': {
      'es': 'Ingrese número de teléfono is required',
      'en': 'Enter phone number is required',
    },
    'jznuwyy2': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'ci3rnqpn': {
      'es': 'Descripcion de Direccion  is required',
      'en': 'Address Description is required',
    },
    'rlg5njxl': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'lb7o2e5t': {
      'es': 'Nombre is required',
      'en': 'Name is required',
    },
    'iffqpm54': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'mx58xc24': {
      'es': 'Email is required',
      'en': 'Email is required',
    },
    'lhzduz4g': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'd87s1df1': {
      'es': 'dialCode is required',
      'en': 'dialCode is required',
    },
    '3c2f6fhb': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'unjuf680': {
      'es': 'Ingrese número de teléfono is required',
      'en': 'Enter phone number is required',
    },
    'bcgylz2e': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // Login
  {
    '2750eib3': {
      'es': 'Chile911',
      'en': 'Chile911',
    },
    '5jnevgs8': {
      'es': 'Registrarse',
      'en': 'Sing Up',
    },
    'g9nv3hpe': {
      'es': 'Crear una cuenta',
      'en': 'Create an account',
    },
    'iuglijhi': {
      'es': 'Comencemos llenando el formulario a continuación.',
      'en': 'Let\'s get started by filling out the form below.',
    },
    'vve9f3u1': {
      'es': 'Correo electrónico',
      'en': 'Email',
    },
    'q1r5jxj5': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'hed67gcd': {
      'es': 'Confirmar contraseña',
      'en': 'Confirm Password',
    },
    '8dhlpofk': {
      'es': 'Empezar',
      'en': 'Get Started',
    },
    'kr9x2qbc': {
      'es': 'Ingresar con',
      'en': 'Or sign up with',
    },
    'z8rjgwkt': {
      'es': 'Ingresar con Google',
      'en': 'Continue with Google',
    },
    '8gbbjrgu': {
      'es': 'Ingresar con Apple',
      'en': 'Continue with Apple',
    },
    'bmlyw02z': {
      'es': 'Ingresar',
      'en': 'Sing In',
    },
    '37zs9j9u': {
      'es': 'Bienvenido de nuevo',
      'en': 'Welcome back',
    },
    'ldv5c8u8': {
      'es': 'Complete la información a continuación para acceder a su cuenta.',
      'en': 'Please complete the information below to access your account.',
    },
    'c4q3ldi5': {
      'es': 'Correo electrónico',
      'en': 'Email',
    },
    'chdaxl80': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    '5qi1x8wn': {
      'es': 'Iniciar sesión',
      'en': 'Login',
    },
    'p0b6t6b3': {
      'es': 'Or sign in with',
      'en': 'Or sign in with',
    },
    '61mbrx25': {
      'es': 'Continue with Google',
      'en': 'Continue with Google',
    },
    'qdsaal4z': {
      'es': 'Continue with Apple',
      'en': 'Continue with Apple',
    },
    'oyhlaaws': {
      'es': '¿Has olvidado tu contraseña?',
      'en': 'Forgot your password?',
    },
    'ahf3xeqa': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Home
  {
    '1f5s1e3y': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Profile
  {
    '11h5awxw': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Map
  {
    'xkwanktu': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // institutionAlerts
  {
    '83iz4x3z': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Chats
  {
    'hfde5wxc': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Chat
  {
    '3z3stpje': {
      'es': 'Escribe algo..',
      'en': 'Write something..',
    },
    'p0o59wxk': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // institutionDashboard
  {
    '1nk4m6w2': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // institutionsManagement
  {
    'y4ve33k6': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // notifications
  {
    'pv5al80u': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // institutionalChat
  {
    '0cvj0tx3': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // institutionalNotifications
  {
    '22hr01o5': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // globalDashboard
  {
    '2eqnvi67': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // usersManagement
  {
    'dgtefuw0': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // chatsManagement
  {
    'vfmsgqrz': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // institutionManagement
  {
    'ivnsqw1m': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // platformManagement
  {
    'hmnghkas': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // phonePickerDialog
  {
    't16pwqsn': {
      'es': 'Elige un país',
      'en': 'Choose a country',
    },
    'dnhkw0hy': {
      'es': 'País',
      'en': 'Country',
    },
    'rsmn8ql4': {
      'es': 'Búsqueda de países',
      'en': 'Search countries',
    },
  },
  // phonePicker
  {
    'e1sbns87': {
      'es': '',
      'en': '',
    },
    '4bv9nza1': {
      'es': '',
      'en': '',
    },
    '7nui67ve': {
      'es': 'Ingrese número de teléfono',
      'en': 'Enter phone number',
    },
  },
  // dataPicker
  {
    'tfvuns28': {
      'es': '',
      'en': '',
    },
  },
  // basicSettings
  {
    'xd7bdbzh': {
      'es': 'Idioma',
      'en': 'Language',
    },
    '1negmaoh': {
      'es': 'Nacionalidad',
      'en': 'Nationality',
    },
    '1mnch9sk': {
      'es': 'Select...',
      'en': 'Select...',
    },
    'efea46m8': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'tr6sr4tc': {
      'es': 'Chileno',
      'en': 'Chilean',
    },
    'mcyl5b6y': {
      'es': 'Extranjero',
      'en': 'Foreign',
    },
  },
  // disabilitySeverity
  {
    'vzlu4q2y': {
      'es': 'Severidad',
      'en': 'Severity',
    },
    '2s9c445p': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'ctdeyypq': {
      'es': 'Muy Leve',
      'en': 'Very Light',
    },
    'pz16n244': {
      'es': 'Leve',
      'en': 'Mild',
    },
    'wmuejuy3': {
      'es': 'Moderada',
      'en': 'Moderate',
    },
    '26jdbfdz': {
      'es': 'Grave',
      'en': 'Serious',
    },
    '8t86clt4': {
      'es': 'Muy Grave',
      'en': 'Very serious',
    },
    'kvh78x8n': {
      'es': 'Completa',
      'en': 'Complete',
    },
  },
  // allergySeverity
  {
    't4cgg6js': {
      'es': 'Severidad',
      'en': 'Severity',
    },
    '5w96mkro': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'ykvqzdna': {
      'es': 'Leve',
      'en': 'Mild',
    },
    '0f2wxqaj': {
      'es': 'Moderada',
      'en': 'Moderate',
    },
    'baw2t78i': {
      'es': 'Severa',
      'en': 'Severe',
    },
    '5sb28e5n': {
      'es': 'De vida o muerte',
      'en': 'Of life or death',
    },
  },
  // createAlert
  {
    'd8dqudjo': {
      'es': 'Nueva Alerta',
      'en': 'New Alert',
    },
    'pgxfi77b': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    'xv8tgfrh': {
      'es': 'Tipo de Alerta',
      'en': 'Alert Type',
    },
    'nuxxgw4g': {
      'es': 'Select...',
      'en': 'Select...',
    },
    'i2tck83l': {
      'es': 'Buscar...',
      'en': 'Search...',
    },
    'xur56qcm': {
      'es': 'Emergencia SOS',
      'en': 'Emergency SOS',
    },
    'b9i0txea': {
      'es': 'Reporte de Crimen / Delito',
      'en': 'Crime Report',
    },
    'lrftz1at': {
      'es': 'Persona Desaparecida',
      'en': 'Missing Person',
    },
    'i2n1sykx': {
      'es': 'Violencia Doméstica / Intrafamiliar',
      'en': 'Domestic Violence',
    },
    'x50g5agl': {
      'es': 'Emergencia Médica',
      'en': 'Medical Emergency',
    },
    'qjuvtgxx': {
      'es': 'Emergencia Animal',
      'en': 'Animal Emergency',
    },
    '7d883mu7': {
      'es': 'Emergencia de Incendio',
      'en': 'Fire Emergency',
    },
    'lqwggrwz': {
      'es': 'Emergencia de Propiedad',
      'en': 'Property Emergency',
    },
    '2v7nemdv': {
      'es': 'Objeto Extraviado',
      'en': 'Lost Property',
    },
    'c0zpx8rg': {
      'es': 'Incidente de Tráfico / Vial',
      'en': 'Traffic Issue',
    },
    '7mtwnzfe': {
      'es': 'Problema de Servicio Público',
      'en': 'Public Service Issue',
    },
    'ehq9ilj2': {
      'es': 'Incidente Escolar',
      'en': 'School Issue',
    },
    'h5ec0p7d': {
      'es': 'Asunto Comunitario',
      'en': 'Community Issue',
    },
    'xo8e5ryl': {
      'es': 'Problema Medioambiental',
      'en': 'Environmental Issue',
    },
    'aslqborp': {
      'es': 'Otro',
      'en': 'Other',
    },
    'i0djngeo': {
      'es': 'Subtipo de Alerta',
      'en': 'Alert Subtype',
    },
    'hg0xdqor': {
      'es': 'Select...',
      'en': 'Select...',
    },
    '9mg275y4': {
      'es': 'Buscar...',
      'en': 'Search...',
    },
    'y0rkax5s': {
      'es': 'Reportar Anonimamente',
      'en': 'Report Anonymously',
    },
    'wjc36qwp': {
      'es': 'Agregar detalles',
      'en': '',
    },
    'n157kmd9': {
      'es': 'Toca en agregar detalles para detallar tu alerta',
      'en': '',
    },
    'u0jduyv3': {
      'es': 'Descripción',
      'en': 'Description',
    },
    'xdzinl9d': {
      'es': 'Ingresar Descripción',
      'en': 'Enter Description',
    },
    'pxndurol': {
      'es': 'Adjuntar Archivos',
      'en': 'Attach Photo',
    },
    'srybrfcm': {
      'es': 'Dirección',
      'en': 'Address',
    },
    '4v8koztv': {
      'es': 'Elegir Direccion',
      'en': 'Choose Direction',
    },
    'bpwl0sw0': {
      'es': 'Descripcion de Direccion ',
      'en': 'Address Description',
    },
    'osy74gvt': {
      'es': 'DEPARTAMENTO/HOTEL/AIRBNB/PARIENTE',
      'en': 'APARTMENT/HOTEL/AIRBNB/RELATIVE',
    },
    'aecijiow': {
      'es': 'Crear Alerta',
      'en': 'Create Alert',
    },
  },
  // sos
  {
    'gnlgndrq': {
      'es': 'Alerta de Socorro',
      'en': 'SOS Alert',
    },
    'sbu1v672': {
      'es':
          '¿Está seguro? Esto enviará inmediatamente su información de ubicación e información de perfil a los servicios de emergencia.',
      'en':
          'Are you sure? This will immediately send your location and profile information to emergency services.',
    },
    'qhlxkttr': {
      'es': 'Confirmar  SOS',
      'en': 'Confirm SOS',
    },
    'steq6dsu': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
  },
  // emptyMessages
  {
    'xf75022u': {
      'es': 'No hay mensajes todavía',
      'en': 'No Messages Yet',
    },
    'b4mjaduc': {
      'es': 'Comience una conversación enviando su primer mensaje',
      'en': 'Start a conversation by sending your first message',
    },
  },
  // userTitle
  {
    'gmc77u1j': {
      'es': '✔',
      'en': '✔',
    },
  },
  // newChat
  {
    'euy4rnzu': {
      'es': 'Search for patients...',
      'en': 'Search for patients...',
    },
    'z11qo39g': {
      'es': 'Sin miembros',
      'en': 'Without members',
    },
    '6noojuf5': {
      'es': 'Crear',
      'en': 'Create',
    },
    '9xdy12te': {
      'es': 'Nombre del grupo',
      'en': 'Group name',
    },
    'txuikq0c': {
      'es': 'Ingrese nombre del grupo',
      'en': 'Enter group name',
    },
    '84pdnwy9': {
      'es': 'Chat Directo',
      'en': 'New Group',
    },
    'kh15kp6u': {
      'es': 'Nuevo Grupo',
      'en': 'New Group',
    },
  },
  // navBar
  {
    '7mon6o4h': {
      'es': 'Inicio',
      'en': 'Home',
    },
    'udf65nqa': {
      'es': 'Mapa',
      'en': 'Map',
    },
    'pmspcutp': {
      'es': 'Mensajeria',
      'en': 'Chats',
    },
    'v9fjzv2c': {
      'es': 'Notificaciones',
      'en': 'Notifications',
    },
    'ofunfi9v': {
      'es': 'Perfil',
      'en': 'Profile',
    },
    'bx2cq5a2': {
      'es': 'Panel',
      'en': 'Dashboard',
    },
    '9i3z31k8': {
      'es': 'Alertas',
      'en': 'Alerts',
    },
    'cz2ovp5z': {
      'es': 'Mensajeria',
      'en': 'Chats',
    },
    'my1z3r8u': {
      'es': 'Notificaciones',
      'en': 'Notifications',
    },
    '98vgm431': {
      'es': 'Institución',
      'en': 'Institution',
    },
    'k5vega8j': {
      'es': 'Panel',
      'en': 'Dashboard',
    },
    'pyhfm1w3': {
      'es': 'Usuarios',
      'en': 'Users',
    },
    '0fyycy78': {
      'es': 'Mensajeria',
      'en': 'Chats',
    },
    'qdovohor': {
      'es': 'Instituciones',
      'en': 'Institutions',
    },
    'sxic6akf': {
      'es': 'Configuracion',
      'en': 'Config',
    },
  },
  // homeContent
  {
    '6ghjgbax': {
      'es': '¿Necesitas ayuda?',
      'en': 'Do you need help?',
    },
    '9ht9lcab': {
      'es': 'Presiona el botón de emergencia o reporta una situación',
      'en': 'Press the emergency button or report a situation',
    },
    'ig6yq1tt': {
      'es': 'SOS',
      'en': 'SOS',
    },
    '6sr6ze2z': {
      'es': 'Reportar Alerta',
      'en': 'Report Alert',
    },
    'ks467owv': {
      'es': 'Reportar Delito',
      'en': 'Report Crime',
    },
    'ltc9qqoh': {
      'es': 'Emergencia médica',
      'en': 'Medical emergency',
    },
    'gzklk7pb': {
      'es': 'Alerta Vehicular',
      'en': 'Vehicle Alert',
    },
    'fltuxquh': {
      'es': 'Rportar Incendio',
      'en': 'Report Fire',
    },
    'h8dhrdl0': {
      'es': 'Problema de servicio puiblico',
      'en': 'Public service problem',
    },
    'rolii14z': {
      'es': 'Emergencia escolar',
      'en': 'School emergency',
    },
    'wmq5wtml': {
      'es': 'Anuncios Oficiales',
      'en': 'Official Announcements',
    },
    '04esgaku': {
      'es': 'Crear Alerta',
      'en': 'Create Alert',
    },
  },
  // profileContent
  {
    'z8b2tzp6': {
      'es': 'Informacion personal',
      'en': 'Personal information',
    },
    '8j26la3c': {
      'es': 'Contactos de emergenia',
      'en': 'Emergency contacts',
    },
    'ysanq8o1': {
      'es': 'Inforamcion medica',
      'en': 'Medical information',
    },
    '4ybm9lfp': {
      'es': 'Configuracion',
      'en': 'Configuration',
    },
    '7v3xmyb5': {
      'es': 'Crear Alerta',
      'en': 'Create Alert',
    },
    'tosuyarv': {
      'es': 'Crear Propuesta',
      'en': 'Create Proposal',
    },
    'ot09umz3': {
      'es': 'Crear Anuncio',
      'en': 'Create Ad',
    },
    'djp1mpbi': {
      'es': 'Crear Encuesta',
      'en': 'Create Survey',
    },
    'q0hd1zfs': {
      'es': 'Log Out',
      'en': 'Log Out',
    },
  },
  // createAnnouncement
  {
    'nu6p4jh3': {
      'es': 'Nuevo Anuncio',
      'en': 'New Announcement',
    },
    'ty1sqxcg': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    'z0iso9ey': {
      'es': 'Tipo de Comunicado',
      'en': 'Type of Communication',
    },
    'u45487sc': {
      'es': 'Select...',
      'en': 'Select...',
    },
    'lsmuggqu': {
      'es': 'Buscar...',
      'en': 'Search...',
    },
    'y76cido3': {
      'es': 'Información general',
      'en': 'General information',
    },
    '4w2vcznb': {
      'es': 'Aviso de emergencia',
      'en': 'Emergency notice',
    },
    'yemyaqeo': {
      'es': 'Aviso ambiental',
      'en': 'Environmental notice',
    },
    '4q1az1ne': {
      'es': 'Aviso de servicio público',
      'en': 'Public service notice',
    },
    'gqrq4e2b': {
      'es': 'Aviso de tráfico',
      'en': 'Traffic notice',
    },
    '7cl9gs88': {
      'es': 'Aviso comunitario',
      'en': 'Community notice',
    },
    'tgecr88z': {
      'es': 'Aviso escolar',
      'en': 'School notice',
    },
    'k89a8xuz': {
      'es': 'Aviso de salud',
      'en': 'Health notice',
    },
    'cj7vrhz5': {
      'es': 'Subtipo de Alerta',
      'en': 'Alert Subtype',
    },
    'eo3rjb7r': {
      'es': 'Select...',
      'en': 'Select...',
    },
    'kz7vbcjb': {
      'es': 'Buscar...',
      'en': 'Search...',
    },
    '0b7s4tzy': {
      'es': 'Severidad',
      'en': 'Severity',
    },
    'l7ue8xl8': {
      'es': 'Select...',
      'en': 'Select...',
    },
    'omoqqt8v': {
      'es': 'Buscar...',
      'en': 'Search...',
    },
    '8a22e1n0': {
      'es': 'Informativo',
      'en': 'Informational',
    },
    'm26c51ao': {
      'es': 'Bajo impacto',
      'en': 'Low impact',
    },
    'jcrhl828': {
      'es': 'Impacto moderado',
      'en': 'Moderate impact',
    },
    'ttr826fo': {
      'es': 'Alto impacto',
      'en': 'High impact',
    },
    'fpyvxaob': {
      'es': 'Crítico y urgente',
      'en': 'Critical and urgent',
    },
    '8ny1flln': {
      'es': 'Titulo',
      'en': 'Qualification',
    },
    'ix3bzvdm': {
      'es': 'Ingresar Titulo',
      'en': 'Enter Title',
    },
    'a4s0hx0v': {
      'es': 'Descripción',
      'en': 'Description',
    },
    '8lqhcwep': {
      'es': 'Ingresar Descripción',
      'en': 'Enter Description',
    },
    '8q3iz4fi': {
      'es': 'Adjuntar Archivos',
      'en': 'Attach Photo',
    },
    'njhc5i7z': {
      'es': 'Fecha de vencimiento',
      'en': 'Expiration date',
    },
    'qjfpqg4o': {
      'es': 'Crear Anuncio',
      'en': 'Create Announcement',
    },
  },
  // createProposal
  {
    'oz0hq3p3': {
      'es': 'Nueva Propuesta',
      'en': 'New Announcement',
    },
    'amxxnd2k': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    '6coxhyc8': {
      'es': 'Tipo de  Propuesta',
      'en': 'Type of Communication',
    },
    'b4b4ibfl': {
      'es': 'Select...',
      'en': 'Select...',
    },
    'e1v9yh70': {
      'es': 'Buscar...',
      'en': 'Search...',
    },
    '1pc975hq': {
      'es': 'Seguridad pública',
      'en': 'Public safety',
    },
    'zr8w7ulc': {
      'es': 'Infraestructura urbana',
      'en': 'Urban infrastructure',
    },
    'amksz5na': {
      'es': 'Medio ambiente',
      'en': 'Environment',
    },
    'r62n099e': {
      'es': 'Bienestar social',
      'en': 'Social welfare',
    },
    'wzpm5dv8': {
      'es': 'Educación',
      'en': 'Education',
    },
    '7jk4m3yj': {
      'es': 'Salud',
      'en': 'Health',
    },
    'ncdhv3ok': {
      'es': 'Transporte',
      'en': 'Transportation',
    },
    'kq3zfkyf': {
      'es': 'Desarrollo económico',
      'en': 'Economic development',
    },
    'xxqlpm5y': {
      'es': 'Otro',
      'en': 'Other',
    },
    'klzefyyj': {
      'es': 'Titulo',
      'en': 'Qualification',
    },
    'kedl8lvv': {
      'es': 'Ingresar Titulo',
      'en': 'Enter Title',
    },
    'vxktkqi4': {
      'es': 'Descripción',
      'en': 'Description',
    },
    'e8bd51lj': {
      'es': 'Ingresar Descripción',
      'en': 'Enter Description',
    },
    'xomzybdp': {
      'es': 'Adjuntar Archivos',
      'en': 'Attach Photo',
    },
    'umlsby0h': {
      'es': 'Crear Anuncio',
      'en': 'Create Announcement',
    },
  },
  // InstitutionalChatContent
  {
    'roe22tnj': {
      'es': 'Anuncios',
      'en': 'Advertisements',
    },
  },
  // modeSwitch
  {
    '4fddwk81': {
      'es': 'Modo Administrativo',
      'en': 'Administrative Mode',
    },
  },
  // institutionAlertsContent
  {
    'mhk96kh2': {
      'es': 'Alertas',
      'en': 'Alerts',
    },
    'lzaif80q': {
      'es': 'Crear Alerta',
      'en': 'Create Alert',
    },
  },
  // createSurvey
  {
    '30khn9ot': {
      'es': 'Nueva Encuesta',
      'en': 'New Announcement',
    },
    '7vcx1v6h': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    '9vt9ia2h': {
      'es': 'Tipo de Comunicado',
      'en': 'Type of Communication',
    },
    'fwd40i6t': {
      'es': 'Select...',
      'en': 'Select...',
    },
    '9jsfqsjf': {
      'es': 'Buscar...',
      'en': 'Search...',
    },
    'zedp3f57': {
      'es': 'Encuesta',
      'en': 'Survey',
    },
    '0ocfjdxf': {
      'es': 'Sondeo',
      'en': 'Poll',
    },
    '53jp4smq': {
      'es': 'Votación',
      'en': 'Vote',
    },
    'xli410sd': {
      'es': 'Titulo',
      'en': 'Qualification',
    },
    'bpjiudhx': {
      'es': 'Ingresar Titulo',
      'en': 'Enter Title',
    },
    'yrvwn0jz': {
      'es': 'Descripción',
      'en': 'Description',
    },
    'ojx8zhug': {
      'es': 'Ingresar Descripción',
      'en': 'Enter Description',
    },
    'b7in9urp': {
      'es': 'Fecha de vencimiento',
      'en': 'Expiration date',
    },
    '91kq6zvr': {
      'es': 'Crear Anuncio',
      'en': 'Create Announcement',
    },
  },
  // chatDetails
  {
    'xa164tiq': {
      'es': 'Añadir al grupo',
      'en': 'Add to group',
    },
    'e1owgkb0': {
      'es': 'Salir del grupo',
      'en': 'Leave the group',
    },
    'gj0hxihj': {
      'es': 'Bloquear',
      'en': 'Block',
    },
    '7eqzs3e6': {
      'es': 'Reportar',
      'en': 'Report',
    },
  },
  // institutionDashboardContent
  {
    'p2ip3gsz': {
      'es': 'Alertas',
      'en': 'Alerts',
    },
    'jeox3s92': {
      'es': 'UID',
      'en': '',
    },
    'lbkk2dar': {
      'es': 'Tipo',
      'en': '',
    },
    'wg64ovjg': {
      'es': 'Prioridad',
      'en': '',
    },
    'pmydc7vn': {
      'es': 'Severidad',
      'en': '',
    },
    'tap8kgrj': {
      'es': 'Actualizado',
      'en': '',
    },
    '8uxfaz2f': {
      'es': 'Estado',
      'en': '',
    },
    'bethn1vo': {
      'es': ' ',
      'en': '',
    },
    'xa5yqrte': {
      'es': 'Ver',
      'en': '',
    },
    'm6sp7egh': {
      'es': 'Crear Alerta',
      'en': 'Create Alert',
    },
  },
  // createInstitution
  {
    'l4bdly4m': {
      'es': 'Nueva Institucion',
      'en': 'New Institution',
    },
    'dgbgifkc': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    'wqo63n8p': {
      'es': 'Tipo de Institucion',
      'en': 'Type of Institution',
    },
    'jtkjmt53': {
      'es': 'Select...',
      'en': 'Select...',
    },
    'qa7osw2y': {
      'es': 'Buscar...',
      'en': 'Search...',
    },
    '1m8g1j63': {
      'es': 'Policía',
      'en': 'Police',
    },
    '1neg5elw': {
      'es': 'Policía de Tránsito',
      'en': 'Traffic Police',
    },
    'hx6cml1j': {
      'es': 'Bomberos',
      'en': 'Fire Department',
    },
    '1g0729mv': {
      'es': 'Protección Civil',
      'en': 'Civil Protection',
    },
    '5ohz6fnz': {
      'es': 'Autoridad Sanitaria',
      'en': 'Health Authority',
    },
    '0vtcytfz': {
      'es': 'Establecimiento de Salud',
      'en': 'Health Facility',
    },
    '59lw8huw': {
      'es': 'Servicios Médicos de Emergencia',
      'en': 'Emergency Medical Services',
    },
    'u086b3r3': {
      'es': 'Autoridad Educativa',
      'en': 'Education Authority',
    },
    '3xs8cjik': {
      'es': 'Establecimiento Educativo',
      'en': 'Educational Facility',
    },
    '9w978dtd': {
      'es': 'Servicios de la Ciudad',
      'en': 'City Services',
    },
    'l6tonb5z': {
      'es': 'Empresa Eléctrica',
      'en': 'Power Utility',
    },
    'yprom6sl': {
      'es': 'Empresa de Agua',
      'en': 'Water Utility',
    },
    'leizkuqd': {
      'es': 'Empresa de Gas',
      'en': 'Gas Utility',
    },
    'bboffhrn': {
      'es': 'Gestión de Residuos',
      'en': 'Waste Management',
    },
    'msl0bmc7': {
      'es': 'Gestión de Carreteras',
      'en': 'Road Management',
    },
    '16cdefyz': {
      'es': 'Gobierno Local',
      'en': 'Local Government',
    },
    'dbxl4h1x': {
      'es': 'Gobierno Nacional',
      'en': 'National Government',
    },
    'lgkszkw0': {
      'es': 'Otra Institución',
      'en': 'Other Institution',
    },
    'on847fy6': {
      'es': 'Cobertura',
      'en': 'Coverage',
    },
    'exe1r1i7': {
      'es': 'Select...',
      'en': 'Select...',
    },
    'ozjlpdx8': {
      'es': 'Buscar...',
      'en': 'Search...',
    },
    '0ywamr30': {
      'es': 'Local',
      'en': 'City',
    },
    '158gvl1e': {
      'es': 'Estatal',
      'en': 'State',
    },
    'gdislu9e': {
      'es': 'Nacional',
      'en': 'Country',
    },
    'cpqsc33e': {
      'es': 'Nombre',
      'en': 'Name',
    },
    '8x1k473p': {
      'es': 'Ingresar Nombre',
      'en': 'Enter Title',
    },
    'kkc49rkm': {
      'es': 'Dirección',
      'en': 'Address',
    },
    '059n9g02': {
      'es': 'Elegir Direccion',
      'en': 'Choose Direction',
    },
    '1azglwir': {
      'es': 'Descripcion de Direccion ',
      'en': 'Address Description',
    },
    '5ycnkj6v': {
      'es': 'FRENTE A / ALADO DE / DENTRO DE ',
      'en': '',
    },
    'kvt6p237': {
      'es': 'Crear Institucion',
      'en': 'Create Announcement',
    },
  },
  // institutionsManagementContent
  {
    'pdjemcp7': {
      'es': 'Institutions',
      'en': 'Alerts',
    },
    'i8uiew3i': {
      'es': 'Name',
      'en': '',
    },
    'mc0rtzmm': {
      'es': 'Tipo',
      'en': '',
    },
    'kl0w7e9w': {
      'es': 'Estado',
      'en': '',
    },
    'b3o27js4': {
      'es': ' ',
      'en': '',
    },
    'afe324pi': {
      'es': 'Ver',
      'en': '',
    },
    '6jejfedr': {
      'es': 'Crear Alerta',
      'en': 'Create Alert',
    },
  },
  // profileSelector
  {
    'oz03kuvb': {
      'es': 'Perfil Actual',
      'en': 'Current Profile',
    },
    'sr0m9cpf': {
      'es': 'Perfil Actual',
      'en': '',
    },
    '6sbdh0w6': {
      'es': 'Search...',
      'en': '',
    },
    'mtu3mtzr': {
      'es': 'Ciudadano',
      'en': 'Citizen',
    },
    'kfi2u2kd': {
      'es': 'Institucional',
      'en': 'Institutional',
    },
    'ln6peyin': {
      'es': 'Administrador',
      'en': 'Admin',
    },
  },
  // PlatformManagementContent
  {
    'qsndtjbd': {
      'es': 'Informacion personal',
      'en': 'Personal information',
    },
    'aspxt94m': {
      'es': 'Contactos de emergenia',
      'en': 'Emergency contacts',
    },
    '6byfdvwp': {
      'es': 'Inforamcion medica',
      'en': 'Medical information',
    },
    'x83obyab': {
      'es': 'Configuracion',
      'en': 'Configuration',
    },
    'awpqobl2': {
      'es': 'Crear Alerta',
      'en': 'Create Alert',
    },
    '9nprt11n': {
      'es': 'Crear Propuesta',
      'en': 'Create Proposal',
    },
    'dn3cwt5j': {
      'es': 'Crear Anuncio',
      'en': 'Create Ad',
    },
    'xgyezfr4': {
      'es': 'Crear Encuesta',
      'en': 'Create Survey',
    },
    'c6qmdesa': {
      'es': 'Log Out',
      'en': 'Log Out',
    },
  },
  // institutionManagementContent
  {
    '8zomspfj': {
      'es': 'Informacion personal',
      'en': 'Personal information',
    },
    'h29zpzt4': {
      'es': 'Contactos de emergenia',
      'en': 'Emergency contacts',
    },
    'xl51f2uy': {
      'es': 'Inforamcion medica',
      'en': 'Medical information',
    },
    'h5rvpx8u': {
      'es': 'Configuracion',
      'en': 'Configuration',
    },
    '0jjqv75g': {
      'es': 'Crear Alerta',
      'en': 'Create Alert',
    },
    'xm4i43oy': {
      'es': 'Crear Propuesta',
      'en': 'Create Proposal',
    },
    'b2u209ov': {
      'es': 'Crear Anuncio',
      'en': 'Create Ad',
    },
    'pdvi0xzz': {
      'es': 'Crear Encuesta',
      'en': 'Create Survey',
    },
    '3y9tzjh3': {
      'es': 'Log Out',
      'en': 'Log Out',
    },
  },
  // InstitutionalNotificationsContent
  {
    'fmqdsb27': {
      'es': 'Anuncios',
      'en': 'Advertisements',
    },
  },
  // chatsManagementContent
  {
    '9m4gjcem': {
      'es': 'Institutions',
      'en': 'Alerts',
    },
    'uczmgfj6': {
      'es': 'Name',
      'en': '',
    },
    'ucqbwfnq': {
      'es': 'Tipo',
      'en': '',
    },
    '3xiuw0tn': {
      'es': 'Estado',
      'en': '',
    },
    'j7rd845z': {
      'es': ' ',
      'en': '',
    },
    'yy2l65xe': {
      'es': 'Ver',
      'en': '',
    },
    'n32v02v3': {
      'es': 'Crear Alerta',
      'en': 'Create Alert',
    },
  },
  // usersManagementContent
  {
    'zg29vnrf': {
      'es': 'Institutions',
      'en': 'Alerts',
    },
    'birr8gq4': {
      'es': 'Name',
      'en': '',
    },
    'i4wsie45': {
      'es': 'Tipo',
      'en': '',
    },
    'efy23nq8': {
      'es': 'Estado',
      'en': '',
    },
    'x0q1v3xv': {
      'es': ' ',
      'en': '',
    },
    'fp7vcuon': {
      'es': 'Ver',
      'en': '',
    },
    '0gn87qs7': {
      'es': 'Crear Alerta',
      'en': 'Create Alert',
    },
  },
  // GlobalDashboardContent
  {
    '8a8gv4m8': {
      'es': 'Institutions',
      'en': 'Alerts',
    },
    'gx15blx7': {
      'es': 'Name',
      'en': '',
    },
    'q5uvkezl': {
      'es': 'Tipo',
      'en': '',
    },
    'posd6zp1': {
      'es': 'Estado',
      'en': '',
    },
    'xc8mwmvd': {
      'es': ' ',
      'en': '',
    },
    '4gxkb8ur': {
      'es': 'Ver',
      'en': '',
    },
    'e7iwp6td': {
      'es': 'Crear Alerta',
      'en': 'Create Alert',
    },
  },
  // header
  {
    '48h89en4': {
      'es': 'Chile 911',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'ob5thteo': {
      'es': 'Nombre',
      'en': 'Name',
    },
    'oxfblam6': {
      'es': 'Ingrese nombre de contacto',
      'en': 'Enter contact name',
    },
    'q6i8njxr': {
      'es': '',
      'en': '',
    },
    'atfnu5nc': {
      'es': '',
      'en': '',
    },
    'nib92k8s': {
      'es': '',
      'en': '',
    },
    'js969m6x': {
      'es': 'need active the notifications ',
      'en': 'need to activate notifications',
    },
    'yjdwddk5': {
      'es': '',
      'en': '',
    },
    'yp1jub2x': {
      'es': '',
      'en': '',
    },
    'nuwu7vsn': {
      'es': '',
      'en': '',
    },
    'hg86dsgk': {
      'es': '',
      'en': '',
    },
    'zek2jwpn': {
      'es': '',
      'en': '',
    },
    'f8twfxjb': {
      'es': '',
      'en': '',
    },
    '1fbifl1e': {
      'es': '',
      'en': '',
    },
    'adug7i5k': {
      'es': '',
      'en': '',
    },
    'ddx9bg87': {
      'es': '',
      'en': '',
    },
    'ltuywdcb': {
      'es': '',
      'en': '',
    },
    'oyrdtjgg': {
      'es': '',
      'en': '',
    },
    '85hsai0e': {
      'es': '',
      'en': '',
    },
    'lojbbj77': {
      'es': '',
      'en': '',
    },
    'yf06agt8': {
      'es': '',
      'en': '',
    },
    'f1sav1kc': {
      'es': '',
      'en': '',
    },
    'co6rwiad': {
      'es': '',
      'en': '',
    },
    'c9vke7ac': {
      'es': '',
      'en': '',
    },
    'o81h5i00': {
      'es': '',
      'en': '',
    },
    '7w04hgwt': {
      'es': '',
      'en': '',
    },
    'uoolg284': {
      'es': '',
      'en': '',
    },
    't975s3hx': {
      'es': '',
      'en': '',
    },
    'gfikfpos': {
      'es': '',
      'en': '',
    },
    'ma6mlf9r': {
      'es': '',
      'en': '',
    },
    'sr514gc9': {
      'es': '',
      'en': '',
    },
    'uwnhe4tq': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
