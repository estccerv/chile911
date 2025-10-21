import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_proposal_widget.dart' show CreateProposalWidget;
import 'package:flutter/material.dart';

class CreateProposalModel extends FlutterFlowModel<CreateProposalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for type widget.
  ProposalType? typeValue;
  FormFieldController<ProposalType>? typeValueController;
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  bool isDataUploading_uploadFotosProposal = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadFotosProposal = [];

  bool isDataUploading_uploadProposal = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadProposal = [];
  List<String> uploadedFileUrls_uploadProposal = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
