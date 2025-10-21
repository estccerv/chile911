import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/chat/chat_details/chat_details_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_header_model.dart';
export 'chat_header_model.dart';

class ChatHeaderWidget extends StatefulWidget {
  const ChatHeaderWidget({
    super.key,
    this.image,
    this.title,
    this.subTitle,
    this.chat,
    this.members,
    required this.action,
  });

  final String? image;
  final String? title;
  final String? subTitle;
  final ChatsRecord? chat;
  final List<UsersRecord>? members;
  final Future Function(bool withMessages)? action;

  @override
  State<ChatHeaderWidget> createState() => _ChatHeaderWidgetState();
}

class _ChatHeaderWidgetState extends State<ChatHeaderWidget> {
  late ChatHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatHeaderModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.action?.call(
        true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
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
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.goNamed(ChatsWidget.routeName);
                      },
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: ChatDetailsWidget(
                                    chat: widget.chat,
                                    members: widget.members,
                                    subTitle: widget.subTitle,
                                    photo: widget.image,
                                    title: widget.title,
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 45.0,
                                height: 45.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  getCORSProxyUrl(
                                    valueOrDefault<String>(
                                      widget.image,
                                      'https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg',
                                    ),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      widget.title,
                                      'title',
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
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
                                  ),
                                  if (widget.subTitle != null &&
                                      widget.subTitle != '')
                                    Text(
                                      valueOrDefault<String>(
                                        widget.subTitle,
                                        'subtitle',
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
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
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
                                    ),
                                ],
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
