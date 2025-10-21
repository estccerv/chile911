import '/flutter_flow/flutter_flow_util.dart';
import '/profile_management/profile_selector/profile_selector_widget.dart';
import 'profile_content_widget.dart' show ProfileContentWidget;
import 'package:flutter/material.dart';

class ProfileContentModel extends FlutterFlowModel<ProfileContentWidget> {
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
