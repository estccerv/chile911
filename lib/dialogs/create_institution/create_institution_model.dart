import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_institution_widget.dart' show CreateInstitutionWidget;
import 'package:flutter/material.dart';

class CreateInstitutionModel extends FlutterFlowModel<CreateInstitutionWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for type widget.
  InstitutionType? typeValue;
  FormFieldController<InstitutionType>? typeValueController;
  // State field(s) for coverage widget.
  InstitutionCoverageArea? coverageValue;
  FormFieldController<InstitutionCoverageArea>? coverageValueController;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for location widget.
  FFPlace locationValue = FFPlace();
  // State field(s) for AddressDetails widget.
  FocusNode? addressDetailsFocusNode;
  TextEditingController? addressDetailsTextController;
  String? Function(BuildContext, String?)?
      addressDetailsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    addressDetailsFocusNode?.dispose();
    addressDetailsTextController?.dispose();
  }
}
