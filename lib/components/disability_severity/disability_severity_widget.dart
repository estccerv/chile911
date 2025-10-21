import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'disability_severity_model.dart';
export 'disability_severity_model.dart';

class DisabilitySeverityWidget extends StatefulWidget {
  const DisabilitySeverityWidget({
    super.key,
    this.init,
    required this.action,
  });

  final UserDisabilitySeverity? init;
  final Future Function(UserDisabilitySeverity? value)? action;

  @override
  State<DisabilitySeverityWidget> createState() =>
      _DisabilitySeverityWidgetState();
}

class _DisabilitySeverityWidgetState extends State<DisabilitySeverityWidget> {
  late DisabilitySeverityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisabilitySeverityModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowDropDown<UserDisabilitySeverity>(
      controller: _model.dropDownValueController ??=
          FormFieldController<UserDisabilitySeverity>(
        _model.dropDownValue ??= widget.init,
      ),
      options: List<UserDisabilitySeverity>.from(UserDisabilitySeverity.values),
      optionLabels: [
        FFLocalizations.of(context).getText(
          'ctdeyypq' /* Muy Leve */,
        ),
        FFLocalizations.of(context).getText(
          'pz16n244' /* Leve */,
        ),
        FFLocalizations.of(context).getText(
          'wmuejuy3' /* Moderada */,
        ),
        FFLocalizations.of(context).getText(
          '26jdbfdz' /* Grave */,
        ),
        FFLocalizations.of(context).getText(
          '8t86clt4' /* Muy Grave */,
        ),
        FFLocalizations.of(context).getText(
          'kvh78x8n' /* Completa */,
        )
      ],
      onChanged: (val) async {
        safeSetState(() => _model.dropDownValue = val);
        await widget.action?.call(
          _model.dropDownValue,
        );
      },
      width: double.infinity,
      height: 40.0,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.inter(
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
          ),
      hintText: FFLocalizations.of(context).getText(
        'vzlu4q2y' /* Severidad */,
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
    );
  }
}
