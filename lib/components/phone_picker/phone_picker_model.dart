import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'phone_picker_widget.dart' show PhonePickerWidget;
import 'package:flutter/material.dart';

class PhonePickerModel extends FlutterFlowModel<PhonePickerWidget> {
  ///  Local state fields for this component.

  String dialCode = '+56';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - phoneList] action in phonePicker widget.
  List<CountryStruct>? phoneCodes;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // State field(s) for dialCode widget.
  FocusNode? dialCodeFocusNode;
  TextEditingController? dialCodeTextController;
  String? Function(BuildContext, String?)? dialCodeTextControllerValidator;
  // State field(s) for dialNumber widget.
  FocusNode? dialNumberFocusNode;
  TextEditingController? dialNumberTextController;
  String? Function(BuildContext, String?)? dialNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dialCodeFocusNode?.dispose();
    dialCodeTextController?.dispose();

    dialNumberFocusNode?.dispose();
    dialNumberTextController?.dispose();
  }
}
