import '/flutter_flow/flutter_flow_util.dart';
import '/profile_management/profile_selector/profile_selector_widget.dart';
import 'header_widget.dart' show HeaderWidget;
import 'package:flutter/material.dart';

class HeaderModel extends FlutterFlowModel<HeaderWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for profileSelector component.
  late ProfileSelectorModel profileSelectorModel;

  @override
  void initState(BuildContext context) {
    profileSelectorModel = createModel(context, () => ProfileSelectorModel());
  }

  @override
  void dispose() {
    profileSelectorModel.dispose();
  }
}
