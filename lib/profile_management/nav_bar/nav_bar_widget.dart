import '/backend/schema/enums/enums.dart';
import '/dialogs/nav_bar_item/nav_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    required this.currentPage,
    required this.isHorizontal,
  });

  final String? currentPage;
  final bool? isHorizontal;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Builder(
        builder: (context) {
          if (FFAppState().appProfile == PlatformProfile.citizen) {
            return Flex(
              direction:
                  widget.isHorizontal! ? Axis.horizontal : Axis.vertical,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        HomeWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navBarItemModel1,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        icon: Icon(
                          Icons.home,
                          color:
                              widget.currentPage == AppCitizenPages.home.name
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondaryText,
                        ),
                        label: FFLocalizations.of(context).getText(
                          '7mon6o4h' /* Inicio */,
                        ),
                        color: widget.currentPage == AppCitizenPages.home.name
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        isHorizontal: widget.isHorizontal!,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        MapWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navBarItemModel2,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        icon: Icon(
                          Icons.map,
                          color: widget.currentPage == AppCitizenPages.map.name
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                        ),
                        label: FFLocalizations.of(context).getText(
                          'udf65nqa' /* Mapa */,
                        ),
                        color: widget.currentPage == AppCitizenPages.map.name
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        isHorizontal: widget.isHorizontal!,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        ChatsWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navBarItemModel3,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        icon: Icon(
                          Icons.chat,
                          color:
                              widget.currentPage == AppCitizenPages.chats.name
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondaryText,
                        ),
                        label: FFLocalizations.of(context).getText(
                          'pmspcutp' /* Mensajeria */,
                        ),
                        color: widget.currentPage == AppCitizenPages.chats.name
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        isHorizontal: widget.isHorizontal!,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        NotificationsWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navBarItemModel4,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        icon: Icon(
                          Icons.notifications_sharp,
                          color: widget.currentPage ==
                                  AppCitizenPages.notifications.name
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                        ),
                        label: FFLocalizations.of(context).getText(
                          'v9fjzv2c' /* Notificaciones */,
                        ),
                        color: widget.currentPage ==
                                AppCitizenPages.notifications.name
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        isHorizontal: widget.isHorizontal!,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        ProfileWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navBarItemModel5,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        icon: Icon(
                          Icons.person,
                          color: widget.currentPage ==
                                  AppCitizenPages.profile.name
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                        ),
                        label: FFLocalizations.of(context).getText(
                          'ofunfi9v' /* Perfil */,
                        ),
                        color:
                            widget.currentPage == AppCitizenPages.profile.name
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).secondaryText,
                        isHorizontal: widget.isHorizontal!,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (FFAppState().appProfile == PlatformProfile.institutional) {
            return Flex(
              direction:
                  widget.isHorizontal! ? Axis.horizontal : Axis.vertical,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        InstitutionDashboardWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navBarItemModel6,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        icon: Icon(
                          Icons.space_dashboard,
                          color: widget.currentPage ==
                                  AppInstitutionalPages
                                      .institutionDashboard.name
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                        ),
                        label: FFLocalizations.of(context).getText(
                          'bx2cq5a2' /* Panel */,
                        ),
                        color: widget.currentPage ==
                                AppInstitutionalPages.institutionDashboard.name
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        isHorizontal: widget.isHorizontal!,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        InstitutionAlertsWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navBarItemModel7,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        icon: Icon(
                          Icons.campaign,
                          color: widget.currentPage ==
                                  AppInstitutionalPages.institutionAlerts.name
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                        ),
                        label: FFLocalizations.of(context).getText(
                          '9i3z31k8' /* Alertas */,
                        ),
                        color: widget.currentPage ==
                                AppInstitutionalPages.institutionAlerts.name
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        isHorizontal: widget.isHorizontal!,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        ChatsWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navBarItemModel8,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        icon: Icon(
                          Icons.mark_chat_unread_rounded,
                          color: widget.currentPage ==
                                  AppInstitutionalPages.InstitutionalChat.name
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                        ),
                        label: FFLocalizations.of(context).getText(
                          'cz2ovp5z' /* Mensajeria */,
                        ),
                        color: widget.currentPage ==
                                AppInstitutionalPages.InstitutionalChat.name
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        isHorizontal: widget.isHorizontal!,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        InstitutionalNotificationsWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navBarItemModel9,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        icon: Icon(
                          Icons.notifications_sharp,
                          color: widget.currentPage ==
                                  AppInstitutionalPages
                                      .InstitutionalNotifications.name
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                        ),
                        label: FFLocalizations.of(context).getText(
                          'my1z3r8u' /* Notificaciones */,
                        ),
                        color: widget.currentPage ==
                                AppInstitutionalPages
                                    .InstitutionalNotifications.name
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        isHorizontal: widget.isHorizontal!,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        InstitutionManagementWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navBarItemModel10,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        icon: Icon(
                          Icons.work_rounded,
                          color: widget.currentPage ==
                                  AppInstitutionalPages
                                      .institutionManagement.name
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                        ),
                        label: FFLocalizations.of(context).getText(
                          '98vgm431' /* Institución */,
                        ),
                        color: widget.currentPage ==
                                AppInstitutionalPages.institutionManagement.name
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        isHorizontal: widget.isHorizontal!,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Flex(
              direction:
                  widget.isHorizontal! ? Axis.horizontal : Axis.vertical,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        GlobalDashboardWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navBarItemModel11,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        icon: Icon(
                          Icons.dashboard,
                          color: widget.currentPage ==
                                  AppAdminPages.GlobalDashboard.name
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                        ),
                        label: FFLocalizations.of(context).getText(
                          'k5vega8j' /* Panel */,
                        ),
                        color: widget.currentPage ==
                                AppAdminPages.GlobalDashboard.name
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        isHorizontal: widget.isHorizontal!,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        UsersManagementWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navBarItemModel12,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        icon: Icon(
                          Icons.people_rounded,
                          color: widget.currentPage ==
                                  AppAdminPages.usersManagement.name
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                        ),
                        label: FFLocalizations.of(context).getText(
                          'pyhfm1w3' /* Usuarios */,
                        ),
                        color: widget.currentPage ==
                                AppAdminPages.usersManagement.name
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        isHorizontal: widget.isHorizontal!,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        ChatsManagementWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navBarItemModel13,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        icon: Icon(
                          Icons.mark_chat_read_rounded,
                          color: widget.currentPage ==
                                  AppAdminPages.chatsManagement.name
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                        ),
                        label: FFLocalizations.of(context).getText(
                          '0fyycy78' /* Mensajeria */,
                        ),
                        color: widget.currentPage ==
                                AppAdminPages.chatsManagement.name
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        isHorizontal: widget.isHorizontal!,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        InstitutionsManagementWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navBarItemModel14,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        icon: Icon(
                          Icons.cases_rounded,
                          color: widget.currentPage ==
                                  AppAdminPages.institutionsManagement.name
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                        ),
                        label: FFLocalizations.of(context).getText(
                          'qdovohor' /* Instituciones */,
                        ),
                        color: widget.currentPage ==
                                AppAdminPages.institutionsManagement.name
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        isHorizontal: widget.isHorizontal!,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        PlatformManagementWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navBarItemModel15,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: NavBarItemWidget(
                        icon: Icon(
                          Icons.settings_sharp,
                          color: widget.currentPage ==
                                  AppAdminPages.PlatformManagement.name
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                        ),
                        label: FFLocalizations.of(context).getText(
                          'sxic6akf' /* Configuracion */,
                        ),
                        color: widget.currentPage ==
                                AppAdminPages.PlatformManagement.name
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        isHorizontal: widget.isHorizontal!,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
