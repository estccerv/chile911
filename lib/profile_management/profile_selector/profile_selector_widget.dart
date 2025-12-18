import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_selector_model.dart';
export 'profile_selector_model.dart';

class ProfileSelectorWidget extends StatefulWidget {
  const ProfileSelectorWidget({super.key});

  @override
  State<ProfileSelectorWidget> createState() => _ProfileSelectorWidgetState();
}

class _ProfileSelectorWidgetState extends State<ProfileSelectorWidget> {
  late ProfileSelectorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileSelectorModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (true) {
        await Future.delayed(
          Duration(
            milliseconds: 500,
          ),
        );
        safeSetState(() {
          _model.appProfileValueController?.value = FFAppState().appProfile!;
          _model.appProfileValue = FFAppState().appProfile!;
        });
      }
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
    context.watch<FFAppState>();

    return Visibility(
      visible: (currentUserDocument?.platformRol != PlatformProfile.citizen) ||
          (currentUserDocument?.platformRol == null),
      child: AuthUserStreamWidget(
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              Text(
                FFLocalizations.of(context).getText(
                  'oz03kuvb' /* Perfil Actual */,
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodySmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodySmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).onPrimary,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodySmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodySmall.fontStyle,
                    ),
              ),
            Flexible(
              child: FlutterFlowDropDown<PlatformProfile>(
                controller: _model.appProfileValueController ??=
                    FormFieldController<PlatformProfile>(
                  _model.appProfileValue ??= FFAppState().appProfile,
                ),
                options: List<PlatformProfile>.from(() {
                  if (valueOrDefault<bool>(
                          currentUserDocument?.isAdmin, false) ==
                      true) {
                    return PlatformProfile.values;
                  } else if (currentUserDocument?.platformRol ==
                      PlatformProfile.institutional) {
                    return PlatformProfile.values
                        .where((e) => e != PlatformProfile.admin)
                        .toList();
                  } else {
                    return PlatformProfile.values
                        .where((e) => e == PlatformProfile.citizen)
                        .toList();
                  }
                }()),
                optionLabels: [
                  FFLocalizations.of(context).getText(
                    'mtu3mtzr' /* Ciudadano */,
                  ),
                  FFLocalizations.of(context).getText(
                    'kfi2u2kd' /* Institucional */,
                  ),
                  FFLocalizations.of(context).getText(
                    'ln6peyin' /* Administrador */,
                  )
                ],
                onChanged: (val) async {
                  safeSetState(() => _model.appProfileValue = val);
                  FFAppState().appProfile = _model.appProfileValue;
                  FFAppState().update(() {});
                },
                width: 135.0,
                height: 40.0,
                menuOffset: Offset(8.0, 8.0),
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                hintText: FFLocalizations.of(context).getText(
                  'sr0m9cpf' /* Perfil Actual */,
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 4.0,
                borderColor: Colors.transparent,
                borderWidth: 0.0,
                borderRadius: 8.0,
                margin: EdgeInsets.all(8.0),
                hidesUnderline: true,
                isOverButton: false,
                isSearchable: false,
                isMultiSelect: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
