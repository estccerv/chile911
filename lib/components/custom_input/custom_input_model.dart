import '/flutter_flow/flutter_flow_util.dart';
import 'custom_input_widget.dart' show CustomInputWidget;
import 'package:flutter/material.dart';

class CustomInputModel extends FlutterFlowModel<CustomInputWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
