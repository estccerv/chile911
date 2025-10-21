import '/backend/schema/enums/enums.dart';
import '/components/data_picker/data_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_announcement_widget.dart' show CreateAnnouncementWidget;
import 'package:flutter/material.dart';

class CreateAnnouncementModel
    extends FlutterFlowModel<CreateAnnouncementWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for type widget.
  AnnouncementType? typeValue;
  FormFieldController<AnnouncementType>? typeValueController;
  // State field(s) for subtype widget.
  String? subtypeValue;
  FormFieldController<String>? subtypeValueController;
  // State field(s) for severity widget.
  AnnouncementSeverity? severityValue;
  FormFieldController<AnnouncementSeverity>? severityValueController;
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  bool isDataUploading_uploadFotosAnnouncement = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadFotosAnnouncement = [];

  // Model for date.
  late DataPickerModel dateModel;
  bool isDataUploading_uploadAnnouncement = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadAnnouncement = [];
  List<String> uploadedFileUrls_uploadAnnouncement = [];

  @override
  void initState(BuildContext context) {
    dateModel = createModel(context, () => DataPickerModel());
  }

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    dateModel.dispose();
  }
}
