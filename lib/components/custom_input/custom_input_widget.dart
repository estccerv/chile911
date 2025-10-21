import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_input_model.dart';
export 'custom_input_model.dart';

class CustomInputWidget extends StatefulWidget {
  const CustomInputWidget({
    super.key,
    this.init,
    this.label,
    this.hint,
    required this.action,
  });

  final String? init;
  final String? label;
  final String? hint;
  final Future Function(String value)? action;

  @override
  State<CustomInputWidget> createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  late CustomInputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomInputModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (true) {
        await Future.delayed(
          Duration(
            milliseconds: 1000,
          ),
        );
        while (!(_model.textFieldFocusNode?.hasFocus ?? false) &&
            (widget.init != _model.textController.text)) {
          safeSetState(() {
            _model.textController?.text = widget.init!;
          });
          await Future.delayed(
            Duration(
              milliseconds: 500,
            ),
          );
        }
      }
    });

    _model.textController ??= TextEditingController(text: widget.init);
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        await widget.action?.call(
          _model.textController.text,
        );
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _model.textController,
      focusNode: _model.textFieldFocusNode,
      onChanged: (_) => EasyDebounce.debounce(
        '_model.textController',
        Duration(milliseconds: 2000),
        () async {
          await Future.delayed(
            Duration(
              milliseconds: 3000,
            ),
          );
          await widget.action?.call(
            _model.textController.text,
          );
        },
      ),
      onFieldSubmitted: (_) async {
        await widget.action?.call(
          _model.textController.text,
        );
      },
      autofocus: false,
      textInputAction: TextInputAction.next,
      obscureText: false,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
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
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.inter(
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
          ),
      validator: _model.textControllerValidator.asValidator(context),
    );
  }
}
