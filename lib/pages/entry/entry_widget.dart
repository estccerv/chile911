import '/auth/base_auth_user_provider.dart';
import '/components/basic_settings/basic_settings_widget.dart';
import '/components/logo/logo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'entry_model.dart';
export 'entry_model.dart';

class EntryWidget extends StatefulWidget {
  const EntryWidget({super.key});

  static String routeName = 'Entry';
  static String routePath = '/entry';

  @override
  State<EntryWidget> createState() => _EntryWidgetState();
}

class _EntryWidgetState extends State<EntryWidget> {
  late EntryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntryModel());

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
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsets.all(28.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                          padding: EdgeInsets.all(40.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'xakuk0u3' /* Chile911 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .displayLarge
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .displayLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displayLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .displayLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displayLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.all(28.0),
                        child: wrapWithModel(
                          model: _model.logoModel,
                          updateCallback: () => safeSetState(() {}),
                          child: LogoWidget(),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.basicSettingsModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BasicSettingsWidget(),
                      ),
                      FFButtonWidget(
                        onPressed: (_model.basicSettingsModel
                                    .nationalitySelectorValue ==
                                null)
                            ? null
                            : () async {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                if (loggedIn) {
                                  context.safePop();
                                } else {
                                  context.goNamed(LoginWidget.routeName);
                                }
                              },
                        text: FFLocalizations.of(context).getText(
                          '7czbz2en' /* Continuar */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(8.0),
                          disabledColor: FlutterFlowTheme.of(context).info,
                          disabledTextColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
