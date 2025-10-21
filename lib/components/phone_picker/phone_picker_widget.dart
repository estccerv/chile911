import '/components/phone_picker_dialog/phone_picker_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'phone_picker_model.dart';
export 'phone_picker_model.dart';

class PhonePickerWidget extends StatefulWidget {
  const PhonePickerWidget({
    super.key,
    String? language,
  }) : this.language = language ?? 'es';

  final String language;

  @override
  State<PhonePickerWidget> createState() => _PhonePickerWidgetState();
}

class _PhonePickerWidgetState extends State<PhonePickerWidget> {
  late PhonePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhonePickerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.phoneCodes = await actions.phoneList(
        widget.language,
      );
      await Future.delayed(
        Duration(
          milliseconds: 10,
        ),
      );
      while (true) {
        await Future.delayed(
          Duration(
            milliseconds: 1000,
          ),
        );
        while (_model.dialCode != _model.dialCodeTextController.text) {
          safeSetState(() {
            _model.dialCodeTextController?.text = _model.dialCode;
          });
          await Future.delayed(
            Duration(
              milliseconds: 500,
            ),
          );
        }
      }
    });

    _model.dialCodeTextController ??=
        TextEditingController(text: _model.dialCode);
    _model.dialCodeFocusNode ??= FocusNode();

    _model.dialNumberTextController ??= TextEditingController();
    _model.dialNumberFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MouseRegion(
          opaque: false,
          cursor: MouseCursor.defer ?? MouseCursor.defer,
          child: Container(
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                _model.mouseRegionHovered
                    ? FlutterFlowTheme.of(context).info
                    : FlutterFlowTheme.of(context).primaryBackground,
                FlutterFlowTheme.of(context).primaryBackground,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 99.0,
                  height: 40.0,
                  child: Stack(
                    children: [
                      TextFormField(
                        controller: _model.dialCodeTextController,
                        focusNode: _model.dialCodeFocusNode,
                        autofocus: false,
                        textInputAction: TextInputAction.next,
                        readOnly: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          alignLabelWithHint: false,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.phone,
                        validator: _model.dialCodeTextControllerValidator
                            .asValidator(context),
                      ),
                      Builder(
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
                                  alignment: AlignmentDirectional(0.0, 1.0)
                                      .resolve(Directionality.of(context)),
                                  child: PhonePickerDialogWidget(
                                    phoneCodes: _model.phoneCodes,
                                    action: (dialCode) async {
                                      _model.dialCode = dialCode;
                                      safeSetState(() {});
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.dialNumberTextController,
                      focusNode: _model.dialNumberFocusNode,
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                        alignLabelWithHint: false,
                        hintText: FFLocalizations.of(context).getText(
                          '7nui67ve' /* Ingrese número de teléfono */,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      keyboardType: TextInputType.phone,
                      validator: _model.dialNumberTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          onEnter: ((event) async {
            safeSetState(() => _model.mouseRegionHovered = true);
          }),
          onExit: ((event) async {
            safeSetState(() => _model.mouseRegionHovered = false);
          }),
        ),
      ],
    );
  }
}
