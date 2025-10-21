import '/chat/chat_profile/chat_profile_widget.dart';
import '/chat/user_title/user_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_details_widget.dart' show ChatDetailsWidget;
import 'package:flutter/material.dart';

class ChatDetailsModel extends FlutterFlowModel<ChatDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for chatProfile component.
  late ChatProfileModel chatProfileModel;
  // Models for userTitle dynamic component.
  late FlutterFlowDynamicModels<UserTitleModel> userTitleModels;

  @override
  void initState(BuildContext context) {
    chatProfileModel = createModel(context, () => ChatProfileModel());
    userTitleModels = FlutterFlowDynamicModels(() => UserTitleModel());
  }

  @override
  void dispose() {
    chatProfileModel.dispose();
    userTitleModels.dispose();
  }
}
