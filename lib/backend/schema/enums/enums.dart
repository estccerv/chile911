import 'package:collection/collection.dart';

enum UserNationality {
  chilean,
  foreign,
}

enum UserGender {
  male,
  female,
  other,
}

enum UserIdentityDocument {
  dni,
  nie,
  passport,
}

enum UserRelationship {
  family,
  friend,
  spouse,
}

enum UserBloodType {
  A_POSITIVE,
  A_NEGATIVE,
  B_POSITIVE,
  B_NEGATIVE,
  AB_POSITIVE,
  AB_NEGATIVE,
  O_POSITIVE,
  O_NEGATIVE,
  UNKNOWN,
}

enum UserAllergySeverity {
  mild,
  moderate,
  severe,
  life_threatening,
}

enum UserDisabilityType {
  auditory,
  visual,
  physical_motor,
  intellectual_cognitive,
  speech_language,
  psychosocial,
}

enum UserDisabilitySeverity {
  very_mild,
  mild,
  moderate,
  severe,
  very_severe,
  complete,
}

enum UserStatus {
  inactive,
  active,
  pending_validation,
  suspended_by_admin,
  deletion_requested,
}

enum PlatformProfile {
  citizen,
  institutional,
  admin,
}

enum AlertType {
  emergency_sos,
  crime_report,
  missing_person,
  domestic_violence,
  medical_emergency,
  animal_emergency,
  fire_emergency,
  property_emergency,
  lost_property,
  traffic_issue,
  public_service_issue,
  school_issue,
  community_issue,
  environmental_issue,
  other,
}

enum AlertStatus {
  submitted,
  received_by_system,
  pending_assignment,
  assigned_to_institution,
  acknowledged_by_operator,
  unit_dispatched,
  on_site,
  intervention_in_progress,
  resolved_successfully,
  resolved_partially,
  resolved_unsuccessfully,
  escalated,
  closed_by_system,
  closed_by_user,
  false_alarm,
}

enum AlertPriority {
  critical,
  high,
  medium,
  low,
  informational,
}

enum AlertSeverity {
  minor,
  moderate,
  serious,
  severe,
  catastrophic,
}

enum InstitutionType {
  police,
  traffic_police,
  fire_department,
  civil_protection,
  health_authority,
  health_facility,
  emergency_medical_services,
  education_authority,
  education_facility,
  city_services,
  power_utility,
  water_utility,
  gas_utility,
  waste_management,
  road_management,
  local_government,
  national_government,
  other_institution,
}

enum InstitutionCoverageArea {
  city,
  state,
  country,
}

enum InstitutionRol {
  admin,
  manager,
  operator,
}

enum ProposalType {
  public_safety,
  urban_infrastructure,
  environment,
  social_welfare,
  education,
  health,
  transportation,
  economic_development,
  other,
}

enum ProposalStatus {
  submitted,
  under_review,
  pending_clarification,
  accepted_for_evaluation,
  rejected,
  partially_accepted,
  implemented,
  archived,
}

enum SurveyType {
  survey,
  poll,
  vote,
}

enum SurveyStatus {
  draft,
  scheduled,
  active_collecting,
  closed_for_responses,
  archived_results_available,
}

enum AnnouncementType {
  general_information,
  emergency_notice,
  environmental_notice,
  public_service_notice,
  traffic_notice,
  community_notice,
  school_notice,
  health_notice,
}

enum AnnouncementSeverity {
  informational,
  low_impact,
  moderate_impact,
  high_impact,
  critical_urgent,
}

enum UserAllergyType {
  food,
  medication,
  animal,
  latex,
  pollen,
  other,
}

enum UserLocationType {
  home,
  work,
  school,
}

enum InstitutionStatus {
  active,
  pending,
  inactive,
  suspended,
  archived,
}

enum SurveyQuestionType {
  single,
  multi,
}

enum EnvironmentalContamination {
  air_pollution,
  water_pollution,
  soil_pollution,
}

enum EnvironmentalNaturalDisaster {
  earthquake,
  tsunami,
  volcanic_eruption,
}

enum EnvironmentalHazard {
  landslide,
  wildfire,
  flood,
  drought,
}

enum EnvironmentalWeatherWarning {
  SEVERE_STORM,
  HEAVY_RAIN,
  HIGH_WIND,
  EXTREME_HEAT,
  EXTREME_COLD,
  SNOWFALL_AND_BLIZZARD,
  DENSE_FOG,
  UV_RADIATION,
}

enum AnnouncementEmergencyNotice {
  evacuation_order,
  lockdown_order,
  curfew_announcement,
  terrorist_threat,
  war_threat,
}

enum AnnouncementEnvironmentalNotice {
  natural_disaster,
  environmental_hazard,
  environmental_contamination,
  weather_warning,
}

enum AnnouncementPublicServiceNotice {
  service_disruption,
  scheduled_maintenance,
  service_restoration,
}

enum AnnouncementTrafficNotice {
  road_closure,
  detour_notice,
}

enum AnnouncementCommunityNotice {
  public_event,
  meeting_notice,
  public_consultation_notice,
}

enum AnnouncementSchoolNotice {
  closure,
  safety_protocol,
}

enum AnnouncementHealthNotice {
  vaccination_campaign,
  pandemic,
}

enum AppCitizenPages {
  home,
  map,
  chats,
  notifications,
  profile,
}

enum InstitutionOperatorRol {
  dispatcher,
}

enum ChatType {
  direct,
  group,
  chatbot,
  system,
}

enum AppInstitutionalPages {
  institutionDashboard,
  institutionAlerts,
  InstitutionalChat,
  InstitutionalNotifications,
  institutionManagement,
}

enum AppAdminPages {
  GlobalDashboard,
  usersManagement,
  chatsManagement,
  institutionsManagement,
  PlatformManagement,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (UserNationality):
      return UserNationality.values.deserialize(value) as T?;
    case (UserGender):
      return UserGender.values.deserialize(value) as T?;
    case (UserIdentityDocument):
      return UserIdentityDocument.values.deserialize(value) as T?;
    case (UserRelationship):
      return UserRelationship.values.deserialize(value) as T?;
    case (UserBloodType):
      return UserBloodType.values.deserialize(value) as T?;
    case (UserAllergySeverity):
      return UserAllergySeverity.values.deserialize(value) as T?;
    case (UserDisabilityType):
      return UserDisabilityType.values.deserialize(value) as T?;
    case (UserDisabilitySeverity):
      return UserDisabilitySeverity.values.deserialize(value) as T?;
    case (UserStatus):
      return UserStatus.values.deserialize(value) as T?;
    case (PlatformProfile):
      return PlatformProfile.values.deserialize(value) as T?;
    case (AlertType):
      return AlertType.values.deserialize(value) as T?;
    case (AlertStatus):
      return AlertStatus.values.deserialize(value) as T?;
    case (AlertPriority):
      return AlertPriority.values.deserialize(value) as T?;
    case (AlertSeverity):
      return AlertSeverity.values.deserialize(value) as T?;
    case (InstitutionType):
      return InstitutionType.values.deserialize(value) as T?;
    case (InstitutionCoverageArea):
      return InstitutionCoverageArea.values.deserialize(value) as T?;
    case (InstitutionRol):
      return InstitutionRol.values.deserialize(value) as T?;
    case (ProposalType):
      return ProposalType.values.deserialize(value) as T?;
    case (ProposalStatus):
      return ProposalStatus.values.deserialize(value) as T?;
    case (SurveyType):
      return SurveyType.values.deserialize(value) as T?;
    case (SurveyStatus):
      return SurveyStatus.values.deserialize(value) as T?;
    case (AnnouncementType):
      return AnnouncementType.values.deserialize(value) as T?;
    case (AnnouncementSeverity):
      return AnnouncementSeverity.values.deserialize(value) as T?;
    case (UserAllergyType):
      return UserAllergyType.values.deserialize(value) as T?;
    case (UserLocationType):
      return UserLocationType.values.deserialize(value) as T?;
    case (InstitutionStatus):
      return InstitutionStatus.values.deserialize(value) as T?;
    case (SurveyQuestionType):
      return SurveyQuestionType.values.deserialize(value) as T?;
    case (EnvironmentalContamination):
      return EnvironmentalContamination.values.deserialize(value) as T?;
    case (EnvironmentalNaturalDisaster):
      return EnvironmentalNaturalDisaster.values.deserialize(value) as T?;
    case (EnvironmentalHazard):
      return EnvironmentalHazard.values.deserialize(value) as T?;
    case (EnvironmentalWeatherWarning):
      return EnvironmentalWeatherWarning.values.deserialize(value) as T?;
    case (AnnouncementEmergencyNotice):
      return AnnouncementEmergencyNotice.values.deserialize(value) as T?;
    case (AnnouncementEnvironmentalNotice):
      return AnnouncementEnvironmentalNotice.values.deserialize(value) as T?;
    case (AnnouncementPublicServiceNotice):
      return AnnouncementPublicServiceNotice.values.deserialize(value) as T?;
    case (AnnouncementTrafficNotice):
      return AnnouncementTrafficNotice.values.deserialize(value) as T?;
    case (AnnouncementCommunityNotice):
      return AnnouncementCommunityNotice.values.deserialize(value) as T?;
    case (AnnouncementSchoolNotice):
      return AnnouncementSchoolNotice.values.deserialize(value) as T?;
    case (AnnouncementHealthNotice):
      return AnnouncementHealthNotice.values.deserialize(value) as T?;
    case (AppCitizenPages):
      return AppCitizenPages.values.deserialize(value) as T?;
    case (InstitutionOperatorRol):
      return InstitutionOperatorRol.values.deserialize(value) as T?;
    case (ChatType):
      return ChatType.values.deserialize(value) as T?;
    case (AppInstitutionalPages):
      return AppInstitutionalPages.values.deserialize(value) as T?;
    case (AppAdminPages):
      return AppAdminPages.values.deserialize(value) as T?;
    default:
      return null;
  }
}
