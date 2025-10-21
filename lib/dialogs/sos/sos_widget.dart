import '/backend/schema/enums/enums.dart';
import '/dialogs/create_alert/create_alert_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sos_model.dart';
export 'sos_model.dart';

/// Emergency SOS Confirmation Prompt
class SosWidget extends StatefulWidget {
  const SosWidget({super.key});

  @override
  State<SosWidget> createState() => _SosWidgetState();
}

class _SosWidgetState extends State<SosWidget> {
  late SosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SosModel());

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
      padding: EdgeInsets.all(24.0),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 320.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).error,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Icon(
                    Icons.warning,
                    color: Colors.white,
                    size: 48.0,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'gnlgndrq' /* Alerta de Socorro */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'sbu1v672' /* ¿Está seguro? Esto enviará inm... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 1.0)
                                  .resolve(Directionality.of(context)),
                              child: CreateAlertWidget(
                                type: AlertType.emergency_sos,
                              ),
                            );
                          },
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'qhlxkttr' /* Confirmar  SOS */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding: EdgeInsets.all(8.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).error,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context).getText(
                      'steq6dsu' /* Cancelar */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).alternate,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ].divide(SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
