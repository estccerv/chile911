import '/backend/backend.dart';
import '/chat/chat_header/chat_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  List<String> images = [];
  void addToImages(String item) => images.add(item);
  void removeFromImages(String item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, String item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(String) updateFn) =>
      images[index] = updateFn(images[index]);

  List<DocumentReference> users = [];
  void addToUsers(DocumentReference item) => users.add(item);
  void removeFromUsers(DocumentReference item) => users.remove(item);
  void removeAtIndexFromUsers(int index) => users.removeAt(index);
  void insertAtIndexInUsers(int index, DocumentReference item) =>
      users.insert(index, item);
  void updateUsersAtIndex(int index, Function(DocumentReference) updateFn) =>
      users[index] = updateFn(users[index]);

  bool execute = false;

  bool withConversation = false;

  ///  State fields for stateful widgets in this page.

  // Model for createChatHeader.
  late ChatHeaderModel createChatHeaderModel;
  ChatsRecord? chatContainerPreviousSnapshot;
  // Model for currentChatHeader.
  late ChatHeaderModel currentChatHeaderModel;
  // State field(s) for messageInput widget.
  FocusNode? messageInputFocusNode;
  TextEditingController? messageInputTextController;
  String? Function(BuildContext, String?)? messageInputTextControllerValidator;
  bool isDataUploading_localUpload = false;
  FFUploadedFile uploadedLocalFile_localUpload =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Backend Call - Create Document] action in sendMessageButton widget.
  ChatsRecord? newChat;
  bool isDataUploading_storageUpload = false;
  FFUploadedFile uploadedLocalFile_storageUpload =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_storageUpload = '';

  // Stores action output result for [Backend Call - Create Document] action in sendMessageButton widget.
  MessagesRecord? message;

  @override
  void initState(BuildContext context) {
    createChatHeaderModel = createModel(context, () => ChatHeaderModel());
    currentChatHeaderModel = createModel(context, () => ChatHeaderModel());
  }

  @override
  void dispose() {
    createChatHeaderModel.dispose();
    currentChatHeaderModel.dispose();
    messageInputFocusNode?.dispose();
    messageInputTextController?.dispose();
  }
}
