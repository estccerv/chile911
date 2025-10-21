import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mode_switch_model.dart';
export 'mode_switch_model.dart';

class ModeSwitchWidget extends StatefulWidget {
  const ModeSwitchWidget({super.key});

  @override
  State<ModeSwitchWidget> createState() => _ModeSwitchWidgetState();
}

class _ModeSwitchWidgetState extends State<ModeSwitchWidget> {
  late ModeSwitchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModeSwitchModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (true) {
        await Future.delayed(
          Duration(
            milliseconds: 500,
          ),
        );
        safeSetState(() {
          _model.switchValue = FFAppState().showDashboard;
        });
      }
    });

    _model.switchValue = FFAppState().showDashboard;
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

    return Visibility(
      visible: currentUserDocument?.platformRol != PlatformProfile.citizen,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: AuthUserStreamWidget(
          builder: (context) => Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  FFLocalizations.of(context).getText(
                    '4fddwk81' /* Modo Administrativo */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              Switch(
                value: _model.switchValue!,
                onChanged: (newValue) async {
                  safeSetState(() => _model.switchValue = newValue);
                  if (newValue) {
                    FFAppState().showDashboard = _model.switchValue!;
                    FFAppState().update(() {});
                  } else {
                    FFAppState().showDashboard = _model.switchValue!;
                    FFAppState().update(() {});
                  }
                },
                activeColor: FlutterFlowTheme.of(context).info,
                activeTrackColor: FlutterFlowTheme.of(context).primary,
                inactiveTrackColor: FlutterFlowTheme.of(context).info,
                inactiveThumbColor: FlutterFlowTheme.of(context).primary,
              ),
            ].divide(SizedBox(width: 24.0)),
          ),
        ),
      ),
    );
  }
}
