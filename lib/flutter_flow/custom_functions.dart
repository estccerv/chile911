import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

bool luhnAgorithm(String input) {
  // validate ID with Luhn algorithm
  int sum = 0;
  final digits = input.split('');
  for (var i = 0; i < digits.length; i++) {
    final digit = digits[i];
    int value;
    switch (digit) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        value = int.parse(digit);
        break;
      case 'J':
      case 'j':
        value = 10;
        break;
      case 'Q':
      case 'q':
        value = 11;
        break;
      case 'K':
      case 'k':
        value = 12;
        break;
      case 'A':
      case 'a':
        value = 13;
        break;
      default:
        return false;
    }
    if (i % 2 == 0) {
      value = value * 2;
      if (value > 9) {
        value -= 9;
      }
    }
    sum += value;
  }
  if (sum % 10 == 0) {
    return true;
  }
  return false;
}

List<String>? stringList(List<String>? urls) {
  return urls ?? [];
}

List<String> subtypeAlert(
  AlertType type,
  String locale,
  bool areLabel,
) {
  // Diccionario principal que contiene todos los subtipos y sus traducciones.
  // La clave es el valor que guardarías en Firestore (ej. 'traffic_accident').
  // El valor es un mapa con las traducciones.
  const Map<String, Map<String, String>> trafficSubtypes = {
    'traffic_accident': {
      'en': 'Traffic Accident',
      'es': 'Accidente de Tráfico'
    },
    'road_hazard': {'en': 'Road Hazard', 'es': 'Peligro en la Vía'},
    'vehicle_breakdown': {'en': 'Vehicle Breakdown', 'es': 'Vehículo Averiado'},
  };

  const Map<String, Map<String, String>> environmentalSubtypes = {
    'environmental_contamination': {
      'en': 'Environmental Contamination',
      'es': 'Contaminación Ambiental'
    },
    'environmental_hazard': {
      'en': 'Environmental Hazard',
      'es': 'Riesgo Ambiental'
    },
  };

  const Map<String, Map<String, String>> publicServiceSubtypes = {
    'power_outage': {'en': 'Power Outage', 'es': 'Corte de Energía'},
    'water_emergency': {'en': 'Water Emergency', 'es': 'Emergencia de Agua'},
    'infrastructure_damage': {
      'en': 'Infrastructure Damage',
      'es': 'Daño a Infraestructura'
    },
  };

  const Map<String, Map<String, String>> communitySubtypes = {
    'suspicious_activity': {
      'en': 'Suspicious Activity',
      'es': 'Actividad Sospechosa'
    },
    'public_disturbance': {
      'en': 'Public Disturbance',
      'es': 'Disturbios Públicos'
    },
    'noise_complaint': {'en': 'Noise Complaint', 'es': 'Queja por Ruido'},
  };

  const Map<String, Map<String, String>> schoolSubtypes = {
    'school_bullying': {
      'en': 'School Bullying',
      'es': 'Acoso Escolar (Bullying)'
    },
    'juvenile_incident': {'en': 'Juvenile Incident', 'es': 'Incidente Juvenil'},
  };

  // Seleccionar el mapa de subtipos correcto basado en el 'AlertType' de entrada.
  Map<String, Map<String, String>> selectedSubtypes;
  switch (type) {
    case AlertType.traffic_issue:
      selectedSubtypes = trafficSubtypes;
      break;
    case AlertType.environmental_issue:
      selectedSubtypes = environmentalSubtypes;
      break;
    case AlertType.public_service_issue:
      selectedSubtypes = publicServiceSubtypes;
      break;
    case AlertType.community_issue:
      selectedSubtypes = communitySubtypes;
      break;
    case AlertType.school_issue:
      selectedSubtypes = schoolSubtypes;
      break;
    default:
      // Si el tipo de alerta no tiene subtipos, devuelve una lista vacía.
      return [];
  }

  // Si se piden etiquetas, devolver la lista de etiquetas traducidas.
  if (areLabel) {
    return selectedSubtypes.entries.map((entry) {
      // Usar el idioma local si está disponible, si no, usar 'en' como fallback.
      // Si no hay traducción, usar la clave como último recurso.
      return entry.value[locale] ?? entry.value['en'] ?? entry.key;
    }).toList();
  } else {
    // Si no se piden etiquetas, devolver la lista de claves (los 'values').
    return selectedSubtypes.keys.toList();
  }
}

List<String> subtypeAnnouncement(
  AnnouncementType type,
  String locale,
  bool areLabel,
) {
  const Map<String, Map<String, String>> emergencyNoticeSubtypes = {
    'evacuation_order': {'en': 'Evacuation Order', 'es': 'Orden de Evacuación'},
    'lockdown_order': {'en': 'Lockdown Order', 'es': 'Orden de Confinamiento'},
    'curfew_announcement': {
      'en': 'Curfew Announcement',
      'es': 'Anuncio de Toque de Queda'
    },
    'terrorist_threat': {'en': 'Terrorist Threat', 'es': 'Amenaza Terrorista'},
    'war_threat': {'en': 'War Threat', 'es': 'Amenaza de Guerra'},
  };

  const Map<String, Map<String, String>> environmentalNoticeSubtypes = {
    'natural_disaster': {'en': 'Natural Disaster', 'es': 'Desastre Natural'},
    'environmental_hazard': {
      'en': 'Environmental Hazard',
      'es': 'Riesgo Ambiental'
    },
    'environmental_contamination': {
      'en': 'Environmental Contamination',
      'es': 'Contaminación Ambiental'
    },
    'weather_warning': {
      'en': 'Weather Warning',
      'es': 'Advertencia Meteorológica'
    },
  };

  const Map<String, Map<String, String>> publicServiceNoticeSubtypes = {
    'service_disruption': {
      'en': 'Service Disruption',
      'es': 'Interrupción del Servicio'
    },
    'scheduled_maintenance': {
      'en': 'Scheduled Maintenance',
      'es': 'Mantenimiento Programado'
    },
    'service_restoration': {
      'en': 'Service Restoration',
      'es': 'Restauración del Servicio'
    },
  };

  const Map<String, Map<String, String>> trafficNoticeSubtypes = {
    'road_closure': {'en': 'Road Closure', 'es': 'Cierre de Carretera'},
    'detour_notice': {'en': 'Detour Notice', 'es': 'Aviso de Desvío'},
  };

  const Map<String, Map<String, String>> communityNoticeSubtypes = {
    'public_event': {'en': 'Public Event', 'es': 'Evento Público'},
    'meeting_notice': {'en': 'Meeting Notice', 'es': 'Aviso de Reunión'},
    'public_consultation_notice': {
      'en': 'Public Consultation Notice',
      'es': 'Aviso de Consulta Pública'
    },
  };

  const Map<String, Map<String, String>> schoolNoticeSubtypes = {
    'closure': {'en': 'Closure', 'es': 'Cierre'},
    'safety_protocol': {
      'en': 'Safety Protocol',
      'es': 'Protocolo de Seguridad'
    },
  };

  const Map<String, Map<String, String>> healthNoticeSubtypes = {
    'vaccination_campaign': {
      'en': 'Vaccination Campaign',
      'es': 'Campaña de Vacunación'
    },
    'pandemic': {'en': 'Pandemic', 'es': 'Pandemia'},
  };

  Map<String, Map<String, String>> selectedSubtypes;
  switch (type) {
    case AnnouncementType.emergency_notice:
      selectedSubtypes = emergencyNoticeSubtypes;
      break;
    case AnnouncementType.environmental_notice:
      selectedSubtypes = environmentalNoticeSubtypes;
      break;
    case AnnouncementType.public_service_notice:
      selectedSubtypes = publicServiceNoticeSubtypes;
      break;
    case AnnouncementType.traffic_notice:
      selectedSubtypes = trafficNoticeSubtypes;
      break;
    case AnnouncementType.community_notice:
      selectedSubtypes = communityNoticeSubtypes;
      break;
    case AnnouncementType.school_notice:
      selectedSubtypes = schoolNoticeSubtypes;
      break;
    case AnnouncementType.health_notice:
      selectedSubtypes = healthNoticeSubtypes;
      break;
    default:
      return [];
  }

  if (areLabel) {
    return selectedSubtypes.entries.map((entry) {
      return entry.value[locale] ?? entry.value['en'] ?? entry.key;
    }).toList();
  } else {
    return selectedSubtypes.keys.toList();
  }
}

Color randomTextColorByUid(String uid) {
  final random = math.Random(uid.hashCode);
  int r, g, b;

  // Generate random colors ensuring they are legible on both white and black backgrounds
  do {
    r = random.nextInt(256);
    g = random.nextInt(256);
    b = random.nextInt(256);
  } while ((r + g + b) < 128 ||
      (r + g + b) > 640); // Adjust thresholds for legibility

  return Color.fromARGB(255, r, g, b);
}

DocumentReference directChatRef(
  String myUid,
  String partherUid,
) {
  // 1. Crea una lista con ambos UIDs para poder ordenarlos.
  List<String> uids = [myUid, partherUid];

  // 2. Ordena la lista alfabéticamente. Esto garantiza que el resultado sea
  //    siempre el mismo, sin importar quién inicie la conversación.
  uids.sort();

  // 3. Une los UIDs ordenados para formar un ID de documento único y consistente.
  String chatDocumentId = uids.join('');
  // Podrías usar un separador si lo prefieres, ej: uids.join('_') -> "userA_userB"
  // Pero unirlos directamente también funciona perfectamente.

  // 4. Crea y devuelve la referencia al documento en la colección 'chats'
  //    utilizando el ID que acabamos de generar.
  return FirebaseFirestore.instance.collection('chats').doc(chatDocumentId);
}
