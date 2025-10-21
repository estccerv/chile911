import '/flutter_flow/flutter_flow_util.dart';
import 'phone_picker_dialog_widget.dart' show PhonePickerDialogWidget;
import 'package:flutter/material.dart';

class PhonePickerDialogModel extends FlutterFlowModel<PhonePickerDialogWidget> {
  ///  Local state fields for this component.

  bool unSelect = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();
  }
}
