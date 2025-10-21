import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'allergy_severity_model.dart';
export 'allergy_severity_model.dart';

class AllergySeverityWidget extends StatefulWidget {
  const AllergySeverityWidget({
    super.key,
    this.init,
    required this.action,
  });

  final UserAllergySeverity? init;
  final Future Function(UserAllergySeverity? value)? action;

  @override
  State<AllergySeverityWidget> createState() => _AllergySeverityWidgetState();
}

class _AllergySeverityWidgetState extends State<AllergySeverityWidget> {
  late AllergySeverityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllergySeverityModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowDropDown<UserAllergySeverity>(
      controller: _model.dropDownValueController ??=
          FormFieldController<UserAllergySeverity>(
        _model.dropDownValue ??= widget.init,
      ),
      options: List<UserAllergySeverity>.from(UserAllergySeverity.values),
      optionLabels: [
        FFLocalizations.of(context).getText(
          'ykvqzdna' /* Leve */,
        ),
        FFLocalizations.of(context).getText(
          '0f2wxqaj' /* Moderada */,
        ),
        FFLocalizations.of(context).getText(
          'baw2t78i' /* Severa */,
        ),
        FFLocalizations.of(context).getText(
          '5sb28e5n' /* De vida o muerte */,
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
        't4cgg6js' /* Severidad */,
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
