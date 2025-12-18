import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/allergy_severity/allergy_severity_widget.dart';
import '/components/basic_settings/basic_settings_widget.dart';
import '/components/custom_input/custom_input_widget.dart';
import '/components/data_picker/data_picker_widget.dart';
import '/components/disability_severity/disability_severity_widget.dart';
import '/components/phone_picker/phone_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'onboard_widget.dart' show OnboardWidget;
import 'package:flutter/material.dart';

class OnboardModel extends FlutterFlowModel<OnboardWidget> {
  ///  Local state fields for this page.

  List<MedicalObservationStruct> conditions = [];
  void addToConditions(MedicalObservationStruct item) => conditions.add(item);
  void removeFromConditions(MedicalObservationStruct item) =>
      conditions.remove(item);
  void removeAtIndexFromConditions(int index) => conditions.removeAt(index);
  void insertAtIndexInConditions(int index, MedicalObservationStruct item) =>
      conditions.insert(index, item);
  void updateConditionsAtIndex(
          int index, Function(MedicalObservationStruct) updateFn) =>
      conditions[index] = updateFn(conditions[index]);

  List<MedicalObservationStruct> medications = [];
  void addToMedications(MedicalObservationStruct item) => medications.add(item);
  void removeFromMedications(MedicalObservationStruct item) =>
      medications.remove(item);
  void removeAtIndexFromMedications(int index) => medications.removeAt(index);
  void insertAtIndexInMedications(int index, MedicalObservationStruct item) =>
      medications.insert(index, item);
  void updateMedicationsAtIndex(
          int index, Function(MedicalObservationStruct) updateFn) =>
      medications[index] = updateFn(medications[index]);

  List<AllergyStruct> allergies = [];
  void addToAllergies(AllergyStruct item) => allergies.add(item);
  void removeFromAllergies(AllergyStruct item) => allergies.remove(item);
  void removeAtIndexFromAllergies(int index) => allergies.removeAt(index);
  void insertAtIndexInAllergies(int index, AllergyStruct item) =>
      allergies.insert(index, item);
  void updateAllergiesAtIndex(int index, Function(AllergyStruct) updateFn) =>
      allergies[index] = updateFn(allergies[index]);

  List<DisabilityStruct> disabilities = [];
  void addToDisabilities(DisabilityStruct item) => disabilities.add(item);
  void removeFromDisabilities(DisabilityStruct item) =>
      disabilities.remove(item);
  void removeAtIndexFromDisabilities(int index) => disabilities.removeAt(index);
  void insertAtIndexInDisabilities(int index, DisabilityStruct item) =>
      disabilities.insert(index, item);
  void updateDisabilitiesAtIndex(
          int index, Function(DisabilityStruct) updateFn) =>
      disabilities[index] = updateFn(disabilities[index]);

  List<AllergyStruct> allergiesCopy = [];
  void addToAllergiesCopy(AllergyStruct item) => allergiesCopy.add(item);
  void removeFromAllergiesCopy(AllergyStruct item) =>
      allergiesCopy.remove(item);
  void removeAtIndexFromAllergiesCopy(int index) =>
      allergiesCopy.removeAt(index);
  void insertAtIndexInAllergiesCopy(int index, AllergyStruct item) =>
      allergiesCopy.insert(index, item);
  void updateAllergiesCopyAtIndex(
          int index, Function(AllergyStruct) updateFn) =>
      allergiesCopy[index] = updateFn(allergiesCopy[index]);

  List<DisabilityStruct> disabilitiesCopy = [];
  void addToDisabilitiesCopy(DisabilityStruct item) =>
      disabilitiesCopy.add(item);
  void removeFromDisabilitiesCopy(DisabilityStruct item) =>
      disabilitiesCopy.remove(item);
  void removeAtIndexFromDisabilitiesCopy(int index) =>
      disabilitiesCopy.removeAt(index);
  void insertAtIndexInDisabilitiesCopy(int index, DisabilityStruct item) =>
      disabilitiesCopy.insert(index, item);
  void updateDisabilitiesCopyAtIndex(
          int index, Function(DisabilityStruct) updateFn) =>
      disabilitiesCopy[index] = updateFn(disabilitiesCopy[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for displayname widget.
  FocusNode? displaynameFocusNode;
  TextEditingController? displaynameTextController;
  String? Function(BuildContext, String?)? displaynameTextControllerValidator;
  String? _displaynameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gudtir9h' /* Nombre Completo is required */,
      );
    }

    return null;
  }

  // State field(s) for identityDocument widget.
  FocusNode? identityDocumentFocusNode;
  TextEditingController? identityDocumentTextController;
  String? Function(BuildContext, String?)?
      identityDocumentTextControllerValidator;
  String? _identityDocumentTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'r6vdx8lg' /* Número Documento Identidad is ... */,
      );
    }

    return null;
  }

  bool isDataUploading_frontImage = false;
  FFUploadedFile uploadedLocalFile_frontImage =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for bloodType widget.
  UserBloodType? bloodTypeValue;
  FormFieldController<UserBloodType>? bloodTypeValueController;
  // State field(s) for gender widget.
  UserGender? genderValue;
  FormFieldController<UserGender>? genderValueController;
  // Model for birthdate.
  late DataPickerModel birthdateModel;
  // Model for phoneNumber.
  late PhonePickerModel phoneNumberModel;
  // State field(s) for location widget.
  FFPlace locationValue = FFPlace();
  // State field(s) for AddressDetails widget.
  FocusNode? addressDetailsFocusNode;
  TextEditingController? addressDetailsTextController;
  String? Function(BuildContext, String?)?
      addressDetailsTextControllerValidator;
  String? _addressDetailsTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ci3rnqpn' /* Descripcion de Direccion  is r... */,
      );
    }

    return null;
  }

  // State field(s) for emergencyName widget.
  FocusNode? emergencyNameFocusNode;
  TextEditingController? emergencyNameTextController;
  String? Function(BuildContext, String?)? emergencyNameTextControllerValidator;
  // State field(s) for relationship widget.
  UserRelationship? relationshipValue;
  FormFieldController<UserRelationship>? relationshipValueController;
  // State field(s) for emergencyEmail widget.
  FocusNode? emergencyEmailFocusNode;
  TextEditingController? emergencyEmailTextController;
  String? Function(BuildContext, String?)?
      emergencyEmailTextControllerValidator;
  // Model for emergencyPhoneNumber.
  late PhonePickerModel emergencyPhoneNumberModel;
  // State field(s) for hasDisabilities widget.
  bool? hasDisabilitiesValue;
  // State field(s) for disabilities widget.
  List<UserDisabilityType>? disabilitiesValue;
  FormFieldController<List<UserDisabilityType>>? disabilitiesValueController;
  // Models for disabilitySeverity dynamic component.
  late FlutterFlowDynamicModels<DisabilitySeverityModel>
      disabilitySeverityModels;
  // State field(s) for hasAllergies widget.
  bool? hasAllergiesValue;
  // State field(s) for allergies widget.
  List<UserAllergyType>? allergiesValue;
  FormFieldController<List<UserAllergyType>>? allergiesValueController;
  // Models for allergySeverity dynamic component.
  late FlutterFlowDynamicModels<AllergySeverityModel> allergySeverityModels;
  // State field(s) for hasConditions widget.
  bool? hasConditionsValue;
  // Models for customInput dynamic component.
  late FlutterFlowDynamicModels<CustomInputModel> customInputModels1;
  // Models for customInput dynamic component.
  late FlutterFlowDynamicModels<CustomInputModel> customInputModels2;
  // State field(s) for hasMedications widget.
  bool? hasMedicationsValue;
  // Models for customInput dynamic component.
  late FlutterFlowDynamicModels<CustomInputModel> customInputModels3;
  // Models for customInput dynamic component.
  late FlutterFlowDynamicModels<CustomInputModel> customInputModels4;
  bool isDataUploading_uploadFrontImage = false;
  FFUploadedFile uploadedLocalFile_uploadFrontImage =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadFrontImage = '';

  // Model for basicSettings component.
  late BasicSettingsModel basicSettingsModel;

  @override
  void initState(BuildContext context) {
    displaynameTextControllerValidator = _displaynameTextControllerValidator;
    identityDocumentTextControllerValidator =
        _identityDocumentTextControllerValidator;
    birthdateModel = createModel(context, () => DataPickerModel());
    phoneNumberModel = createModel(context, () => PhonePickerModel());
    addressDetailsTextControllerValidator =
        _addressDetailsTextControllerValidator;
    emergencyPhoneNumberModel = createModel(context, () => PhonePickerModel());
    disabilitySeverityModels =
        FlutterFlowDynamicModels(() => DisabilitySeverityModel());
    allergySeverityModels =
        FlutterFlowDynamicModels(() => AllergySeverityModel());
    customInputModels1 = FlutterFlowDynamicModels(() => CustomInputModel());
    customInputModels2 = FlutterFlowDynamicModels(() => CustomInputModel());
    customInputModels3 = FlutterFlowDynamicModels(() => CustomInputModel());
    customInputModels4 = FlutterFlowDynamicModels(() => CustomInputModel());
    basicSettingsModel = createModel(context, () => BasicSettingsModel());
    birthdateModel.textControllerValidator = _formTextFieldValidator1;
    phoneNumberModel.dialNumberTextControllerValidator =
        _formTextFieldValidator2;
  }

  @override
  void dispose() {
    displaynameFocusNode?.dispose();
    displaynameTextController?.dispose();

    identityDocumentFocusNode?.dispose();
    identityDocumentTextController?.dispose();

    birthdateModel.dispose();
    phoneNumberModel.dispose();
    addressDetailsFocusNode?.dispose();
    addressDetailsTextController?.dispose();

    emergencyNameFocusNode?.dispose();
    emergencyNameTextController?.dispose();

    emergencyEmailFocusNode?.dispose();
    emergencyEmailTextController?.dispose();

    emergencyPhoneNumberModel.dispose();
    disabilitySeverityModels.dispose();
    allergySeverityModels.dispose();
    customInputModels1.dispose();
    customInputModels2.dispose();
    customInputModels3.dispose();
    customInputModels4.dispose();
    basicSettingsModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'r0bj2lqi' /* title is required */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g9o57g05' /* Ingrese número de teléfono is ... */,
      );
    }

    return null;
  }
}
