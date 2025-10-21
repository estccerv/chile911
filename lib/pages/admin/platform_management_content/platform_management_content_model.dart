import '/flutter_flow/flutter_flow_util.dart';
import '/profile_management/profile_selector/profile_selector_widget.dart';
import 'platform_management_content_widget.dart'
    show PlatformManagementContentWidget;
import 'package:flutter/material.dart';

class PlatformManagementContentModel
    extends FlutterFlowModel<PlatformManagementContentWidget> {
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
