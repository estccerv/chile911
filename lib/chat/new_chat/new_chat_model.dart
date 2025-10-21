import '/backend/backend.dart';
import '/chat/user_title/user_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_chat_widget.dart' show NewChatWidget;
import 'package:flutter/material.dart';

class NewChatModel extends FlutterFlowModel<NewChatWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> members = [];
  void addToMembers(DocumentReference item) => members.add(item);
  void removeFromMembers(DocumentReference item) => members.remove(item);
  void removeAtIndexFromMembers(int index) => members.removeAt(index);
  void insertAtIndexInMembers(int index, DocumentReference item) =>
      members.insert(index, item);
  void updateMembersAtIndex(int index, Function(DocumentReference) updateFn) =>
      members[index] = updateFn(members[index]);

  List<DocumentReference> admins = [];
  void addToAdmins(DocumentReference item) => admins.add(item);
  void removeFromAdmins(DocumentReference item) => admins.remove(item);
  void removeAtIndexFromAdmins(int index) => admins.removeAt(index);
  void insertAtIndexInAdmins(int index, DocumentReference item) =>
      admins.insert(index, item);
  void updateAdminsAtIndex(int index, Function(DocumentReference) updateFn) =>
      admins[index] = updateFn(admins[index]);

  bool grupalChat = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Models for userTitle dynamic component.
  late FlutterFlowDynamicModels<UserTitleModel> userTitleModels;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newGroup;
  // State field(s) for groupName widget.
  FocusNode? groupNameFocusNode;
  TextEditingController? groupNameTextController;
  String? Function(BuildContext, String?)? groupNameTextControllerValidator;

  @override
  void initState(BuildContext context) {
    userTitleModels = FlutterFlowDynamicModels(() => UserTitleModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    userTitleModels.dispose();
    groupNameFocusNode?.dispose();
    groupNameTextController?.dispose();
  }
}
