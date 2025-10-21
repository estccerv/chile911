import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/chat/empty_text/empty_text_widget.dart';
import '/chat/user_title/user_title_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'new_chat_model.dart';
export 'new_chat_model.dart';

class NewChatWidget extends StatefulWidget {
  const NewChatWidget({
    super.key,
    required this.chats,
  });

  final List<ChatsRecord>? chats;

  @override
  State<NewChatWidget> createState() => _NewChatWidgetState();
}

class _NewChatWidgetState extends State<NewChatWidget> {
  late NewChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewChatModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.groupNameTextController ??= TextEditingController();
    _model.groupNameFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 0.0),
      child: StreamBuilder<List<UsersRecord>>(
        stream: queryUsersRecord(),
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
          List<UsersRecord> containerUsersRecordList =
              snapshot.data!.where((u) => u.uid != currentUserUid).toList();

          return Container(
            height: MediaQuery.sizeOf(context).height * 0.75,
            constraints: BoxConstraints(
              maxHeight: 420.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController1,
                      focusNode: _model.textFieldFocusNode,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: false,
                        labelText: FFLocalizations.of(context).getText(
                          'euy4rnzu' /* Search for patients... */,
                        ),
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      maxLines: null,
                      validator:
                          _model.textController1Validator.asValidator(context),
                    ),
                  ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 15.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final listUsers = containerUsersRecordList
                            .where((e) => e.reference != currentUserReference)
                            .toList()
                            .sortedList(keyOf: (e) => e.displayName, desc: true)
                            .toList();

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listUsers.length,
                          separatorBuilder: (_, __) => SizedBox(height: 8.0),
                          itemBuilder: (context, listUsersIndex) {
                            final listUsersItem = listUsers[listUsersIndex];
                            return wrapWithModel(
                              model: _model.userTitleModels.getModel(
                                listUsersItem.reference.id,
                                listUsersIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: UserTitleWidget(
                                key: Key(
                                  'Keyobj_${listUsersItem.reference.id}',
                                ),
                                user: listUsersItem,
                                grupalChat: _model.grupalChat,
                                action: (ref, add) async {
                                  if (_model.grupalChat) {
                                    if (add) {
                                      _model.addToMembers(ref);
                                      safeSetState(() {});
                                    } else {
                                      _model.removeFromMembers(ref);
                                      safeSetState(() {});
                                    }
                                  } else {
                                    Navigator.pop(context);

                                    context.pushNamed(
                                      ChatWidget.routeName,
                                      pathParameters: {
                                        'chatRef': serializeParam(
                                          functions.directChatRef(
                                              currentUserReference!.id,
                                              listUsersItem.reference.id),
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                      queryParameters: {
                                        'userRef': serializeParam(
                                          widget.chats
                                                      ?.where((e) =>
                                                          e.reference ==
                                                          functions.directChatRef(
                                                              currentUserReference!
                                                                  .id,
                                                              listUsersItem
                                                                  .reference
                                                                  .id))
                                                      .toList()
                                                      .firstOrNull !=
                                                  null
                                              ? null
                                              : listUsersItem.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (_model.grupalChat) {
                      return Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Builder(
                                    builder: (context) {
                                      final users = _model.members.toList();
                                      if (users.isEmpty) {
                                        return EmptyTextWidget(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'z11qo39g' /* Sin miembros */,
                                          ),
                                        );
                                      }

                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(users.length,
                                              (usersIndex) {
                                            final usersItem = users[usersIndex];
                                            return Container(
                                              width: 40.0,
                                              height: 40.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                getCORSProxyUrl(
                                                  valueOrDefault<String>(
                                                    containerUsersRecordList
                                                        .where((e) =>
                                                            e.reference ==
                                                            usersItem)
                                                        .toList()
                                                        .firstOrNull
                                                        ?.photoUrl,
                                                    'https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg',
                                                  ),
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          }).divide(SizedBox(width: 4.0)),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    _model.addToMembers(currentUserReference!);
                                    _model.addToAdmins(currentUserReference!);
                                    safeSetState(() {});

                                    var chatsRecordReference =
                                        ChatsRecord.collection.doc();
                                    await chatsRecordReference.set({
                                      ...createChatsRecordData(
                                        groupInfo: updateChatInfoStruct(
                                          ChatInfoStruct(
                                            title: _model.groupNameTextController
                                                            .text !=
                                                        ''
                                                ? _model.groupNameTextController
                                                    .text
                                                : 'Chat ${random_data.randomInteger(1000, 10000).toString()}',
                                            admins: _model.admins,
                                          ),
                                          clearUnsetFields: false,
                                          create: true,
                                        ),
                                        createdAt: getCurrentTimestamp,
                                        lastTimestamp: getCurrentTimestamp,
                                        chatType: ChatType.group,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'usersRefs': _model.members,
                                        },
                                      ),
                                    });
                                    _model.newGroup =
                                        ChatsRecord.getDocumentFromData({
                                      ...createChatsRecordData(
                                        groupInfo: updateChatInfoStruct(
                                          ChatInfoStruct(
                                            title: _model.groupNameTextController
                                                            .text !=
                                                        ''
                                                ? _model.groupNameTextController
                                                    .text
                                                : 'Chat ${random_data.randomInteger(1000, 10000).toString()}',
                                            admins: _model.admins,
                                          ),
                                          clearUnsetFields: false,
                                          create: true,
                                        ),
                                        createdAt: getCurrentTimestamp,
                                        lastTimestamp: getCurrentTimestamp,
                                        chatType: ChatType.group,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'usersRefs': _model.members,
                                        },
                                      ),
                                    }, chatsRecordReference);
                                    Navigator.pop(context);

                                    context.pushNamed(
                                      ChatWidget.routeName,
                                      pathParameters: {
                                        'chatRef': serializeParam(
                                          _model.newGroup?.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );

                                    safeSetState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '6noojuf5' /* Crear */,
                                  ),
                                  icon: Icon(
                                    Icons.done,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .onSecondary,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                            TextFormField(
                              controller: _model.groupNameTextController,
                              focusNode: _model.groupNameFocusNode,
                              autofocus: false,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  '9xdy12te' /* Nombre del grupo */,
                                ),
                                hintText: FFLocalizations.of(context).getText(
                                  'txuikq0c' /* Ingrese nombre del grupo */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              keyboardType: TextInputType.name,
                              validator: _model.groupNameTextControllerValidator
                                  .asValidator(context),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                _model.grupalChat = !_model.grupalChat;
                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '84pdnwy9' /* Chat Directo */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .onPrimary,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.all(16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.grupalChat = !_model.grupalChat;
                            safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'kh15kp6u' /* Nuevo Grupo */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).onTertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
