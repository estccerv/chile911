import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'basic_settings_model.dart';
export 'basic_settings_model.dart';

class BasicSettingsWidget extends StatefulWidget {
  const BasicSettingsWidget({super.key});

  @override
  State<BasicSettingsWidget> createState() => _BasicSettingsWidgetState();
}

class _BasicSettingsWidgetState extends State<BasicSettingsWidget> {
  late BasicSettingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BasicSettingsModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'xd7bdbzh' /* Idioma */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
            ),
            FlutterFlowLanguageSelector(
              width: 200.0,
              height: 40.0,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              borderColor: Colors.transparent,
              dropdownIconColor: FlutterFlowTheme.of(context).secondaryText,
              borderRadius: 8.0,
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
              hideFlags: true,
              flagSize: 24.0,
              flagTextGap: 8.0,
              currentLanguage: FFLocalizations.of(context).languageCode,
              languages: FFLocalizations.languages(),
              onChanged: (lang) => setAppLanguage(context, lang),
            ),
          ].divide(SizedBox(height: 5.0)),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                '1negmaoh' /* Nacionalidad */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
            ),
            FlutterFlowDropDown<UserNationality>(
              controller: _model.nationalitySelectorValueController ??=
                  FormFieldController<UserNationality>(
                _model.nationalitySelectorValue ??= FFAppState().nationality,
              ),
              options: List<UserNationality>.from(UserNationality.values),
              optionLabels: [
                FFLocalizations.of(context).getText(
                  'tr6sr4tc' /* Chileno */,
                ),
                FFLocalizations.of(context).getText(
                  'mcyl5b6y' /* Extranjero */,
                )
              ],
              onChanged: (val) async {
                safeSetState(() => _model.nationalitySelectorValue = val);
                FFAppState().nationality = _model.nationalitySelectorValue;
                safeSetState(() {});
              },
              width: 200.0,
              height: 40.0,
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
                '1mnch9sk' /* Select... */,
              ),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 2.0,
              borderColor: Colors.transparent,
              borderWidth: 0.0,
              borderRadius: 8.0,
              margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              hidesUnderline: true,
              isOverButton: false,
              isSearchable: false,
              isMultiSelect: false,
            ),
          ].divide(SizedBox(height: 5.0)),
        ),
      ].divide(SizedBox(height: 12.0)),
    );
  }
}
