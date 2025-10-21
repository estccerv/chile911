import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'phone_picker_dialog_model.dart';
export 'phone_picker_dialog_model.dart';

class PhonePickerDialogWidget extends StatefulWidget {
  const PhonePickerDialogWidget({
    super.key,
    this.phoneCodes,
    required this.action,
  });

  final List<CountryStruct>? phoneCodes;
  final Future Function(String dialCode)? action;

  @override
  State<PhonePickerDialogWidget> createState() =>
      _PhonePickerDialogWidgetState();
}

class _PhonePickerDialogWidgetState extends State<PhonePickerDialogWidget> {
  late PhonePickerDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhonePickerDialogModel());

    _model.searchFieldTextController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();

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
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 0.75,
        constraints: BoxConstraints(
          maxWidth: 450.0,
          maxHeight: 420.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  't16pwqsn' /* Elige un país */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
              ),
              TextFormField(
                controller: _model.searchFieldTextController,
                focusNode: _model.searchFieldFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.searchFieldTextController',
                  Duration(milliseconds: 2000),
                  () async {
                    await Future.delayed(
                      Duration(
                        milliseconds: 1000,
                      ),
                    );
                    safeSetState(() {
                      _model.simpleSearchResults = TextSearch((widget
                                  .phoneCodes!
                                  .map((e) => e.search)
                                  .toList() as List)
                              .cast<String>()
                              .map(
                                  (str) => TextSearchItem.fromTerms(str, [str]))
                              .toList())
                          .search(_model.searchFieldTextController.text)
                          .map((r) => r.object)
                          .toList();
                      ;
                    });
                  },
                ),
                autofocus: false,
                textInputAction: TextInputAction.next,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: FFLocalizations.of(context).getText(
                    'dnhkw0hy' /* País */,
                  ),
                  hintText: FFLocalizations.of(context).getText(
                    'rsmn8ql4' /* Búsqueda de países */,
                  ),
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
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  prefixIcon: Icon(
                    Icons.search_sharp,
                  ),
                  suffixIcon: _model.searchFieldTextController!.text.isNotEmpty
                      ? InkWell(
                          onTap: () async {
                            _model.searchFieldTextController?.clear();
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            safeSetState(() {
                              _model.simpleSearchResults = TextSearch((widget
                                          .phoneCodes!
                                          .map((e) => e.search)
                                          .toList() as List)
                                      .cast<String>()
                                      .map((str) =>
                                          TextSearchItem.fromTerms(str, [str]))
                                      .toList())
                                  .search(_model.searchFieldTextController.text)
                                  .map((r) => r.object)
                                  .toList();
                              ;
                            });
                            safeSetState(() {});
                          },
                          child: Icon(
                            Icons.clear,
                            size: 22,
                          ),
                        )
                      : null,
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
                validator: _model.searchFieldTextControllerValidator
                    .asValidator(context),
              ),
              Flexible(
                child: Builder(
                  builder: (context) {
                    final dialCodes = (_model.searchFieldTextController.text != ''
                                ? widget.phoneCodes
                                    ?.where((e) => _model.simpleSearchResults
                                        .contains(e.search))
                                    .toList()
                                : widget.phoneCodes)
                            ?.toList() ??
                        [];

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: dialCodes.length,
                      itemBuilder: (context, dialCodesIndex) {
                        final dialCodesItem = dialCodes[dialCodesIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await widget.action?.call(
                                  dialCodesItem.dialCode,
                                );
                                _model.unSelect = false;
                                safeSetState(() {});
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      if (isWeb) {
                                        return Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: getCORSProxyUrl(
                                                dialCodesItem.image,
                                              ),
                                              width: 45.0,
                                              height: 45.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Text(
                                            dialCodesItem.emoji,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        dialCodesItem.name,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        dialCodesItem.code,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                                Text(
                                                  dialCodesItem.commonName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      dialCodesItem.dialCode,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 2.0,
                              indent: 12.0,
                              endIndent: 12.0,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
