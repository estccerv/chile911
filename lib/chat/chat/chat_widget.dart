import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/chat/chat_header/chat_header_widget.dart';
import '/chat/empty_messages/empty_messages_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    this.chatRef,
    this.userRef,
  });

  final DocumentReference? chatRef;
  final DocumentReference? userRef;

  static String routeName = 'Chat';
  static String routePath = '/chat/:chatRef';

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    _model.messageInputTextController ??= TextEditingController();
    _model.messageInputFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.userRef != null)
                StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(widget.userRef!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }

                    final createChatHeaderUsersRecord = snapshot.data!;

                    return wrapWithModel(
                      model: _model.createChatHeaderModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ChatHeaderWidget(
                        image: createChatHeaderUsersRecord.photoUrl,
                        title: createChatHeaderUsersRecord.displayName,
                        subTitle: '',
                        action: (withMessages) async {},
                      ),
                    );
                  },
                ),
              Expanded(
                child: StreamBuilder<ChatsRecord>(
                  stream: ChatsRecord.getDocument(widget.chatRef!)
                    ..listen((chatContainerChatsRecord) async {
                      if (_model.chatContainerPreviousSnapshot != null &&
                          !ChatsRecordDocumentEquality().equals(
                              chatContainerChatsRecord,
                              _model.chatContainerPreviousSnapshot)) {
                        _model.users = chatContainerChatsRecord.usersRefs
                            .where((e) => e.id != currentUserReference?.id)
                            .toList()
                            .cast<DocumentReference>();
                        _model.withConversation = true;
                        safeSetState(() {});
                        triggerPushNotification(
                          notificationTitle:
                              FFLocalizations.of(context).getVariableText(
                            esText: 'Nuevo Mensaje',
                            enText: 'New Message',
                          ),
                          notificationText:
                              _model.messageInputTextController.text,
                          userRefs: _model.users.toList(),
                          initialPageName: 'Chat',
                          parameterData: {
                            'chatRef': widget.chatRef,
                          },
                        );

                        safeSetState(() {});
                      }
                      _model.chatContainerPreviousSnapshot =
                          chatContainerChatsRecord;
                    }),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return EmptyMessagesWidget();
                    }

                    final chatContainerChatsRecord = snapshot.data!;

                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord
                              .whereIn(
                                  'uid',
                                  chatContainerChatsRecord.usersRefs
                                      .map((e) => e.id)
                                      .toList())
                              .orderBy('created_time', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<UsersRecord> usersContainerUsersRecordList =
                              snapshot.data!;

                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (widget.userRef == null)
                                  wrapWithModel(
                                    model: _model.currentChatHeaderModel,
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: ChatHeaderWidget(
                                      image: valueOrDefault<String>(
                                        (widget.chatRef == null) ||
                                                (chatContainerChatsRecord
                                                        .chatType ==
                                                    ChatType.direct)
                                            ? valueOrDefault<String>(
                                                usersContainerUsersRecordList
                                                    .where((e) =>
                                                        e.uid !=
                                                        currentUserReference
                                                            ?.id)
                                                    .toList()
                                                    .firstOrNull
                                                    ?.photoUrl,
                                                'https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg',
                                              )
                                            : chatContainerChatsRecord
                                                .groupInfo.image,
                                        'https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg',
                                      ),
                                      title: valueOrDefault<String>(
                                        (widget.chatRef == null) ||
                                                (chatContainerChatsRecord
                                                        .chatType ==
                                                    ChatType.direct)
                                            ? valueOrDefault<String>(
                                                usersContainerUsersRecordList
                                                    .where((e) =>
                                                        e.uid !=
                                                        currentUserReference
                                                            ?.id)
                                                    .toList()
                                                    .firstOrNull
                                                    ?.displayName,
                                                'Name',
                                              )
                                            : chatContainerChatsRecord
                                                .groupInfo.title,
                                        'Display Name',
                                      ),
                                      subTitle: (widget.chatRef == null) ||
                                              (chatContainerChatsRecord
                                                      .chatType ==
                                                  ChatType.direct)
                                          ? chatContainerChatsRecord
                                              .groupInfo.description
                                          : null,
                                      chat: chatContainerChatsRecord,
                                      members: usersContainerUsersRecordList,
                                      action: (withMessages) async {
                                        _model.withConversation = withMessages;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                Expanded(
                                  child: StreamBuilder<List<MessagesRecord>>(
                                    stream: queryMessagesRecord(
                                      parent:
                                          chatContainerChatsRecord.reference,
                                      queryBuilder: (messagesRecord) =>
                                          messagesRecord.orderBy('timestamp',
                                              descending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<MessagesRecord>
                                          conversationMessagesRecordList =
                                          snapshot.data!;

                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final messages =
                                                conversationMessagesRecordList
                                                    .toList();
                                            if (messages.isEmpty) {
                                              return EmptyMessagesWidget();
                                            }

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              reverse: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: messages.length,
                                              itemBuilder:
                                                  (context, messagesIndex) {
                                                final messagesItem =
                                                    messages[messagesIndex];
                                                return custom_widgets
                                                    .ChatCheckRead(
                                                  width: double.infinity,
                                                  height: 200.0,
                                                  message: messagesItem,
                                                  user:
                                                      usersContainerUsersRecordList
                                                          .where((e) =>
                                                              e.reference ==
                                                              messagesItem
                                                                  .userRef)
                                                          .toList()
                                                          .firstOrNull,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              AuthUserStreamWidget(
                builder: (context) => Container(
                  decoration: BoxDecoration(
                    color: () {
                      if (currentUserDocument?.platformRol ==
                          PlatformProfile.citizen) {
                        return FlutterFlowTheme.of(context).primary;
                      } else if (currentUserDocument?.platformRol ==
                          PlatformProfile.institutional) {
                        return FlutterFlowTheme.of(context).primaryText;
                      } else if (currentUserDocument?.platformRol ==
                          PlatformProfile.admin) {
                        return FlutterFlowTheme.of(context).error;
                      } else {
                        return FlutterFlowTheme.of(context).primary;
                      }
                    }(),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                maxWidth: 280.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if ((_model.uploadedLocalFile_localUpload
                                              .bytes?.isNotEmpty ??
                                          false))
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.memory(
                                        _model.uploadedLocalFile_localUpload
                                                .bytes ??
                                            Uint8List.fromList([]),
                                        width: 320.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  TextFormField(
                                    controller:
                                        _model.messageInputTextController,
                                    focusNode: _model.messageInputFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '3z3stpje' /* Escribe algo.. */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    maxLines: 6,
                                    minLines: 1,
                                    validator: _model
                                        .messageInputTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 24.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).accent2,
                          icon: Icon(
                            Icons.image,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              maxWidth: 1080.00,
                              maxHeight: 1080.00,
                              imageQuality: 80,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(() =>
                                  _model.isDataUploading_localUpload = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              try {
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();
                              } finally {
                                _model.isDataUploading_localUpload = false;
                              }
                              if (selectedUploadedFiles.length ==
                                  selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile_localUpload =
                                      selectedUploadedFiles.first;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }
                          },
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 24.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.send_rounded,
                            color: () {
                              if (currentUserDocument?.platformRol ==
                                  PlatformProfile.citizen) {
                                return FlutterFlowTheme.of(context).primary;
                              } else if (currentUserDocument?.platformRol ==
                                  PlatformProfile.institutional) {
                                return FlutterFlowTheme.of(context).primaryText;
                              } else if (currentUserDocument?.platformRol ==
                                  PlatformProfile.admin) {
                                return FlutterFlowTheme.of(context).error;
                              } else {
                                return FlutterFlowTheme.of(context).primary;
                              }
                            }(),
                            size: 20.0,
                          ),
                          onPressed: () async {
                            final firestoreBatch =
                                FirebaseFirestore.instance.batch();
                            try {
                              if (_model.execute) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'El mensaje se esta enviando',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              } else if ((_model.messageInputTextController.text !=
                                          '') ||
                                  ((_model.uploadedLocalFile_localUpload
                                              .bytes?.isNotEmpty ??
                                          false))) {
                                _model.execute = true;
                                _model.addToUsers(currentUserReference!);
                                safeSetState(() {});
                                if (!_model.withConversation) {
                                  _model.addToUsers(widget.userRef!);
                                  _model.withConversation = true;
                                  safeSetState(() {});

                                  var chatsRecordReference =
                                      ChatsRecord.collection.doc(functions
                                          .directChatRef(currentUserUid,
                                              widget.userRef!.id)
                                          .id);
                                  firestoreBatch.set(chatsRecordReference, {
                                    ...createChatsRecordData(
                                      lastTimestamp: getCurrentTimestamp,
                                      createdAt: getCurrentTimestamp,
                                      chatType: ChatType.direct,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'usersRefs': _model.users,
                                      },
                                    ),
                                  });
                                  _model.newChat =
                                      ChatsRecord.getDocumentFromData({
                                    ...createChatsRecordData(
                                      lastTimestamp: getCurrentTimestamp,
                                      createdAt: getCurrentTimestamp,
                                      chatType: ChatType.direct,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'usersRefs': _model.users,
                                      },
                                    ),
                                  }, chatsRecordReference);
                                }
                                if ((_model.uploadedLocalFile_localUpload.bytes
                                            ?.isNotEmpty ??
                                        false)) {
                                  {
                                    safeSetState(() => _model
                                        .isDataUploading_storageUpload = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];
                                    var selectedMedia = <SelectedFile>[];
                                    var downloadUrls = <String>[];
                                    try {
                                      selectedUploadedFiles = _model
                                              .uploadedLocalFile_localUpload
                                              .bytes!
                                              .isNotEmpty
                                          ? [
                                              _model
                                                  .uploadedLocalFile_localUpload
                                            ]
                                          : <FFUploadedFile>[];
                                      selectedMedia =
                                          selectedFilesFromUploadedFiles(
                                        selectedUploadedFiles,
                                      );
                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      _model.isDataUploading_storageUpload =
                                          false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile_storageUpload =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl_storageUpload =
                                            downloadUrls.first;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }

                                  _model.addToImages(
                                      _model.uploadedFileUrl_storageUpload);
                                  safeSetState(() {});
                                }

                                var messagesRecordReference =
                                    MessagesRecord.createDoc(widget.chatRef!);
                                firestoreBatch.set(
                                    messagesRecordReference,
                                    createMessagesRecordData(
                                      timestamp: getCurrentTimestamp,
                                      userRef: currentUserReference,
                                      content: _model
                                          .messageInputTextController.text,
                                      attachment: updateAttachmentStruct(
                                        AttachmentStruct(
                                          images: _model.images,
                                        ),
                                        clearUnsetFields: false,
                                        create: true,
                                      ),
                                    ));
                                _model.message =
                                    MessagesRecord.getDocumentFromData(
                                        createMessagesRecordData(
                                          timestamp: getCurrentTimestamp,
                                          userRef: currentUserReference,
                                          content: _model
                                              .messageInputTextController.text,
                                          attachment: updateAttachmentStruct(
                                            AttachmentStruct(
                                              images: _model.images,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                        ),
                                        messagesRecordReference);

                                firestoreBatch.update(
                                    widget.chatRef!,
                                    createChatsRecordData(
                                      lastMessage: _model.message?.content,
                                      lastTimestamp: _model.message?.timestamp,
                                      lastMessageSeen: false,
                                      lastMessageRef: _model.message?.reference,
                                    ));
                                safeSetState(() {
                                  _model.messageInputTextController?.clear();
                                });
                                safeSetState(() {
                                  _model.isDataUploading_localUpload = false;
                                  _model.uploadedLocalFile_localUpload =
                                      FFUploadedFile(
                                          bytes: Uint8List.fromList([]));
                                });

                                _model.images = [];
                                _model.execute = false;
                                safeSetState(() {});
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'No puedes enviar mensaje en blanco',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }
                            } finally {
                              await firestoreBatch.commit();
                            }

                            safeSetState(() {});
                          },
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
