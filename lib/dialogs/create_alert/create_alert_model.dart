import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_alert_widget.dart' show CreateAlertWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CreateAlertModel extends FlutterFlowModel<CreateAlertWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for type widget.
  AlertType? typeValue;
  FormFieldController<AlertType>? typeValueController;
  // State field(s) for subtype widget.
  String? subtypeValue;
  FormFieldController<String>? subtypeValueController;
  // State field(s) for annonimous widget.
  bool? annonimousValue;
  // State field(s) for Details widget.
  late ExpandableController detailsExpandableController;

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  bool isDataUploading_uploadFotos = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadFotos = [];

  // State field(s) for location widget.
  FFPlace locationValue = FFPlace();
  // State field(s) for AddressDetails widget.
  FocusNode? addressDetailsFocusNode;
  TextEditingController? addressDetailsTextController;
  String? Function(BuildContext, String?)?
      addressDetailsTextControllerValidator;
  bool isDataUploading_uploadAlert = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadAlert = [];
  List<String> uploadedFileUrls_uploadAlert = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    detailsExpandableController.dispose();
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    addressDetailsFocusNode?.dispose();
    addressDetailsTextController?.dispose();
  }
}
