import '/backend/schema/enums/enums.dart';
import '/components/data_picker/data_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_survey_widget.dart' show CreateSurveyWidget;
import 'package:flutter/material.dart';

class CreateSurveyModel extends FlutterFlowModel<CreateSurveyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for type widget.
  SurveyType? typeValue;
  FormFieldController<SurveyType>? typeValueController;
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // Model for date.
  late DataPickerModel dateModel;

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
