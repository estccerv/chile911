import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/components/allergy_severity/allergy_severity_widget.dart';
import '/components/basic_settings/basic_settings_widget.dart';
import '/components/custom_input/custom_input_widget.dart';
import '/components/data_picker/data_picker_widget.dart';
import '/components/disability_severity/disability_severity_widget.dart';
import '/components/phone_picker/phone_picker_widget.dart';
import '/components/view_image/view_image_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboard_model.dart';
export 'onboard_model.dart';

class OnboardWidget extends StatefulWidget {
  const OnboardWidget({super.key});

  static String routeName = 'Onboard';
  static String routePath = '/onboard';

  @override
  State<OnboardWidget> createState() => _OnboardWidgetState();
}

class _OnboardWidgetState extends State<OnboardWidget> {
  late OnboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

    _model.displaynameTextController ??= TextEditingController();
    _model.displaynameFocusNode ??= FocusNode();

    _model.identityDocumentTextController ??= TextEditingController();
    _model.identityDocumentFocusNode ??= FocusNode();

    _model.addressDetailsTextController ??= TextEditingController();
    _model.addressDetailsFocusNode ??= FocusNode();

    _model.emergencyNameTextController ??= TextEditingController();
    _model.emergencyNameFocusNode ??= FocusNode();

    _model.emergencyEmailTextController ??= TextEditingController();
    _model.emergencyEmailFocusNode ??= FocusNode();

    _model.hasDisabilitiesValue = false;
    _model.hasAllergiesValue = false;
    _model.hasConditionsValue = false;
    _model.hasMedicationsValue = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        endDrawer: Drawer(
          elevation: 16.0,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
            child: wrapWithModel(
              model: _model.basicSettingsModel,
              updateCallback: () => safeSetState(() {}),
              child: BasicSettingsWidget(),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: Visibility(
            visible: responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '40oit8u6' /* Registro de Usuario */,
            ),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.settings_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed(EntryWidget.routeName);
                },
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'mrdf0u29' /* Datos Personales */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                              TextFormField(
                                controller: _model.displaynameTextController,
                                focusNode: _model.displaynameFocusNode,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'p46f13iq' /* Nombre Completo */,
                                  ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'nzh5u2gk' /* Ingrese su nombre completo */,
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
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                keyboardType: TextInputType.name,
                                validator: _model
                                    .displaynameTextControllerValidator
                                    .asValidator(context),
                              ),
                              TextFormField(
                                controller:
                                    _model.identityDocumentTextController,
                                focusNode: _model.identityDocumentFocusNode,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    '8vontsy1' /* Número Documento Identidad */,
                                  ),
                                  hintText: FFLocalizations.of(context).getText(
                                    's3cwiul3' /* Ingrese su número de documento */,
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
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                keyboardType: TextInputType.number,
                                validator: _model
                                    .identityDocumentTextControllerValidator
                                    .asValidator(context),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'd2ac59o8' /* Foto documento identidad */,
                                    ),
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
                                  Container(
                                    width: double.infinity,
                                    height: 180.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.memory(
                                                    _model.uploadedLocalFile_frontImage
                                                            .bytes ??
                                                        Uint8List.fromList([]),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: 'imageTag',
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: 'imageTag',
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.memory(
                                                _model.uploadedLocalFile_frontImage
                                                        .bytes ??
                                                    Uint8List.fromList([]),
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      maxWidth: 1080.00,
                                                      maxHeight: 1080.00,
                                                      imageQuality: 100,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading_frontImage =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];

                                                      try {
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading_frontImage =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile_frontImage =
                                                              selectedUploadedFiles
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'txldddjy' /* Adjuntar Foto */,
                                                  ),
                                                  icon: Icon(
                                                    Icons.file_upload_outlined,
                                                    size: 28.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 180.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .interTight(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                            ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: () async {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child:
                                                                  ViewImageWidget(
                                                                imageFile: _model
                                                                    .uploadedLocalFile_frontImage,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'jvjxjfkp' /* Ver Foto */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 180.0,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .interTight(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'qurlff3x' /* Tipo de sangre */,
                                    ),
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
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                        child:
                                            FlutterFlowDropDown<UserBloodType>(
                                          controller: _model
                                                  .bloodTypeValueController ??=
                                              FormFieldController<
                                                  UserBloodType>(
                                            _model.bloodTypeValue ??=
                                                UserBloodType.UNKNOWN,
                                          ),
                                          options: List<UserBloodType>.from(
                                              UserBloodType.values),
                                          optionLabels: [
                                            FFLocalizations.of(context).getText(
                                              'n8svh4c5' /* A+ */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'ezec8b4x' /* A- */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'v17r8a7s' /* B+ */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'h3xsmard' /* B- */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'pmj0q5rl' /* AB+ */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'k6bp1ou1' /* AB- */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'u865jc1p' /* O+ */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'q53xsidh' /* O- */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'g80b8q8c' /* Desconocido */,
                                            )
                                          ],
                                          onChanged: (val) => safeSetState(() =>
                                              _model.bloodTypeValue = val),
                                          height: 40.0,
                                          textStyle: FlutterFlowTheme.of(
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
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'prlk28ar' /* Select... */,
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'uxgi4xvu' /* Género */,
                                    ),
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
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                        child: FlutterFlowDropDown<UserGender>(
                                          controller: _model
                                                  .genderValueController ??=
                                              FormFieldController<UserGender>(
                                            _model.genderValue ??=
                                                UserGender.other,
                                          ),
                                          options: List<UserGender>.from(
                                              UserGender.values),
                                          optionLabels: [
                                            FFLocalizations.of(context).getText(
                                              'uq467wuc' /* Masculino */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'zbjyra2r' /* Femenino */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'plv3jt6r' /* Otro */,
                                            )
                                          ],
                                          onChanged: (val) => safeSetState(
                                              () => _model.genderValue = val),
                                          height: 40.0,
                                          textStyle: FlutterFlowTheme.of(
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
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '9imoknte' /* Select... */,
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'yoxyj643' /* Fecha de nacimiento */,
                                    ),
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
                                  wrapWithModel(
                                    model: _model.birthdateModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: DataPickerWidget(
                                      title: FFLocalizations.of(context)
                                          .getVariableText(
                                        esText:
                                            'Ingrese su fecha de nacimiento',
                                        enText: 'Enter your date of birth',
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'f7bep5gm' /* Teléfono */,
                                    ),
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
                                  wrapWithModel(
                                    model: _model.phoneNumberModel,
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: PhonePickerWidget(
                                      language: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '43l4fjqs' /* Dirección */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                              FlutterFlowPlacePicker(
                                iOSGoogleMapsApiKey:
                                    'AIzaSyBA_J96MEcf1e2aTrFNYOUK2Oe_4GzHO4o',
                                androidGoogleMapsApiKey:
                                    'AIzaSyBA_J96MEcf1e2aTrFNYOUK2Oe_4GzHO4o',
                                webGoogleMapsApiKey:
                                    'AIzaSyBA_J96MEcf1e2aTrFNYOUK2Oe_4GzHO4o',
                                onSelect: (place) async {
                                  safeSetState(
                                      () => _model.locationValue = place);
                                },
                                defaultText:
                                    FFLocalizations.of(context).getText(
                                  '3ydsn8m1' /* Elegir Direccion */,
                                ),
                                icon: Icon(
                                  Icons.place,
                                  size: 16.0,
                                ),
                                buttonOptions: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40.0,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              if (valueOrDefault<bool>(
                                _model.locationValue != null,
                                false,
                              ))
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              _model.locationValue.address,
                                              'address',
                                            ),
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
                                          Text(
                                            valueOrDefault<String>(
                                              _model.locationValue.city,
                                              'city',
                                            ),
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
                                          Text(
                                            valueOrDefault<String>(
                                              _model.locationValue.country,
                                              'country',
                                            ),
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
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              _model.locationValue.name,
                                              'name',
                                            ),
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
                                          Text(
                                            valueOrDefault<String>(
                                              _model.locationValue.state,
                                              'state',
                                            ),
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
                                          Text(
                                            valueOrDefault<String>(
                                              _model.locationValue.zipCode,
                                              'zipcode',
                                            ),
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              TextFormField(
                                controller: _model.addressDetailsTextController,
                                focusNode: _model.addressDetailsFocusNode,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'nzq1hrxd' /* Descripcion de Direccion  */,
                                  ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'l7yv0gjd' /* DEPARTAMENTO/HOTEL/AIRBNB/PARI... */,
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
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                validator: _model
                                    .addressDetailsTextControllerValidator
                                    .asValidator(context),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '9nmwsi2d' /* Contacto de Emergencia */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                              TextFormField(
                                controller: _model.emergencyNameTextController,
                                focusNode: _model.emergencyNameFocusNode,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'hddf8agn' /* Nombre */,
                                  ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'ndny7dtt' /* Ingrese nombre de contacto */,
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
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                keyboardType: TextInputType.name,
                                validator: _model
                                    .emergencyNameTextControllerValidator
                                    .asValidator(context),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    child:
                                        FlutterFlowDropDown<UserRelationship>(
                                      controller: _model
                                              .relationshipValueController ??=
                                          FormFieldController<UserRelationship>(
                                        _model.relationshipValue ??=
                                            UserRelationship.friend,
                                      ),
                                      options: List<UserRelationship>.from(
                                          UserRelationship.values),
                                      optionLabels: [
                                        FFLocalizations.of(context).getText(
                                          '6oaehoax' /* Familia */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'ymjjg7no' /* Amigo */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'yc43ws4b' /* Pareja */,
                                        )
                                      ],
                                      onChanged: (val) => safeSetState(
                                          () => _model.relationshipValue = val),
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
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
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'hhtqrh9l' /* Relacion */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                controller: _model.emergencyEmailTextController,
                                focusNode: _model.emergencyEmailFocusNode,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'xsj6ju3r' /* Email */,
                                  ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '3iq51zuv' /* Ingrese email de contacto */,
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
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                keyboardType: TextInputType.emailAddress,
                                validator: _model
                                    .emergencyEmailTextControllerValidator
                                    .asValidator(context),
                              ),
                              wrapWithModel(
                                model: _model.emergencyPhoneNumberModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: PhonePickerWidget(
                                  language:
                                      FFLocalizations.of(context).languageCode,
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'jpnsxo54' /* Información Médica */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'e6mfbwt9' /* ¿Posee algún tipo de discapaci... */,
                                          ),
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
                                      Switch.adaptive(
                                        value: _model.hasDisabilitiesValue!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.hasDisabilitiesValue =
                                                  newValue);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context).info,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context).info,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (_model.hasDisabilitiesValue ??
                                          false) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 1.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: FlutterFlowDropDown<
                                                          UserDisabilityType>(
                                                        multiSelectController: _model
                                                                .disabilitiesValueController ??=
                                                            FormListFieldController<
                                                                    UserDisabilityType>(
                                                                null),
                                                        options: List<
                                                                UserDisabilityType>.from(
                                                            UserDisabilityType
                                                                .values),
                                                        optionLabels: [
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'osvylmwn' /* Auditiva */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'dnc8tysm' /* Visual */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'yph38suc' /* Física */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'o9xdmz7o' /* Intelectual */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'kmkpc1os' /* Lenguaje */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'sitnucik' /* Psicosocial */,
                                                          )
                                                        ],
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'gh48xzo7' /* Discapacidades */,
                                                        ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderWidth: 0.0,
                                                        borderRadius: 0.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: true,
                                                        onMultiSelectChanged:
                                                            (val) async {
                                                          safeSetState(() =>
                                                              _model.disabilitiesValue =
                                                                  val);
                                                          _model.disabilities =
                                                              [];
                                                          for (int loop1Index =
                                                                  0;
                                                              loop1Index <
                                                                  _model
                                                                      .disabilitiesValue!
                                                                      .length;
                                                              loop1Index++) {
                                                            final currentLoop1Item =
                                                                _model.disabilitiesValue![
                                                                    loop1Index];
                                                            _model.insertAtIndexInDisabilities(
                                                                loop1Index,
                                                                DisabilityStruct(
                                                                  type:
                                                                      currentLoop1Item,
                                                                  severity: _model
                                                                          .disabilitiesCopy
                                                                          .isNotEmpty
                                                                      ? _model
                                                                          .disabilitiesCopy
                                                                          .where((e) =>
                                                                              e.type ==
                                                                              currentLoop1Item)
                                                                          .toList()
                                                                          .firstOrNull
                                                                          ?.severity
                                                                      : UserDisabilitySeverity
                                                                          .very_mild,
                                                                ));
                                                          }
                                                          _model.disabilitiesCopy =
                                                              _model
                                                                  .disabilities
                                                                  .toList()
                                                                  .cast<
                                                                      DisabilityStruct>();
                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final medicalDisabilities =
                                                        _model.disabilities
                                                            .toList();

                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          medicalDisabilities
                                                              .length,
                                                          (medicalDisabilitiesIndex) {
                                                        final medicalDisabilitiesItem =
                                                            medicalDisabilities[
                                                                medicalDisabilitiesIndex];
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                    esText: () {
                                                                      if (medicalDisabilitiesItem
                                                                              .type ==
                                                                          UserDisabilityType
                                                                              .auditory) {
                                                                        return 'Auditiva';
                                                                      } else if (medicalDisabilitiesItem
                                                                              .type ==
                                                                          UserDisabilityType
                                                                              .visual) {
                                                                        return 'Visual';
                                                                      } else if (medicalDisabilitiesItem
                                                                              .type ==
                                                                          UserDisabilityType
                                                                              .physical_motor) {
                                                                        return 'Física';
                                                                      } else if (medicalDisabilitiesItem
                                                                              .type ==
                                                                          UserDisabilityType
                                                                              .intellectual_cognitive) {
                                                                        return 'Intelectual';
                                                                      } else if (medicalDisabilitiesItem
                                                                              .type ==
                                                                          UserDisabilityType
                                                                              .speech_language) {
                                                                        return 'Lenguaje';
                                                                      } else {
                                                                        return 'Psicosocial';
                                                                      }
                                                                    }(),
                                                                    enText: () {
                                                                      if (medicalDisabilitiesItem
                                                                              .type ==
                                                                          UserDisabilityType
                                                                              .auditory) {
                                                                        return 'Hearing';
                                                                      } else if (medicalDisabilitiesItem
                                                                              .type ==
                                                                          UserDisabilityType
                                                                              .visual) {
                                                                        return 'Visual';
                                                                      } else if (medicalDisabilitiesItem
                                                                              .type ==
                                                                          UserDisabilityType
                                                                              .physical_motor) {
                                                                        return 'Physics';
                                                                      } else if (medicalDisabilitiesItem
                                                                              .type ==
                                                                          UserDisabilityType
                                                                              .intellectual_cognitive) {
                                                                        return 'Intellectual';
                                                                      } else if (medicalDisabilitiesItem
                                                                              .type ==
                                                                          UserDisabilityType
                                                                              .speech_language) {
                                                                        return 'Language';
                                                                      } else {
                                                                        return 'Psychosocial';
                                                                      }
                                                                    }(),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                wrapWithModel(
                                                                  model: _model
                                                                      .disabilitySeverityModels
                                                                      .getModel(
                                                                    medicalDisabilitiesItem
                                                                        .type!
                                                                        .name,
                                                                    medicalDisabilitiesIndex,
                                                                  ),
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  updateOnChange:
                                                                      true,
                                                                  child:
                                                                      DisabilitySeverityWidget(
                                                                    key: Key(
                                                                      'Keyjex_${medicalDisabilitiesItem.type!.name}',
                                                                    ),
                                                                    init: medicalDisabilitiesItem.severity !=
                                                                            null
                                                                        ? medicalDisabilitiesItem
                                                                            .severity
                                                                        : UserDisabilitySeverity
                                                                            .very_mild,
                                                                    action:
                                                                        (value) async {
                                                                      _model
                                                                          .updateDisabilitiesAtIndex(
                                                                        medicalDisabilitiesIndex,
                                                                        (e) => e
                                                                          ..severity =
                                                                              value,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      10.0)),
                                                            ),
                                                          ),
                                                        );
                                                      }).divide(SizedBox(
                                                          height: 8.0)),
                                                    );
                                                  },
                                                ),
                                              ].divide(SizedBox(height: 10.0)),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Container(
                                          width: 0.0,
                                          height: 0.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'p1ajm2s6' /* ¿Tiene algún tipo de alergias? */,
                                          ),
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
                                      Switch.adaptive(
                                        value: _model.hasAllergiesValue!,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .hasAllergiesValue = newValue);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context).info,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context).info,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (_model.hasAllergiesValue ?? false) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 1.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              UserAllergyType>(
                                                        multiSelectController: _model
                                                                .allergiesValueController ??=
                                                            FormListFieldController<
                                                                    UserAllergyType>(
                                                                null),
                                                        options: List<
                                                                UserAllergyType>.from(
                                                            UserAllergyType
                                                                .values),
                                                        optionLabels: [
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'uzcgiq5v' /* Comida */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'nk1rp0q8' /* Medicina */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'oj6r6d0y' /* Animal */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'a5rmvs33' /* Latex */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'l4ow6rzf' /* Polen */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ta58id2i' /* Otro */,
                                                          )
                                                        ],
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'b8hnygyy' /* Alergias */,
                                                        ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderWidth: 0.0,
                                                        borderRadius: 0.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: true,
                                                        onMultiSelectChanged:
                                                            (val) async {
                                                          safeSetState(() =>
                                                              _model.allergiesValue =
                                                                  val);
                                                          _model.allergies = [];
                                                          for (int loop1Index =
                                                                  0;
                                                              loop1Index <
                                                                  _model
                                                                      .allergiesValue!
                                                                      .length;
                                                              loop1Index++) {
                                                            final currentLoop1Item =
                                                                _model.allergiesValue![
                                                                    loop1Index];
                                                            _model
                                                                .insertAtIndexInAllergies(
                                                                    loop1Index,
                                                                    AllergyStruct(
                                                                      type:
                                                                          currentLoop1Item,
                                                                      severity: _model
                                                                              .allergiesCopy
                                                                              .isNotEmpty
                                                                          ? _model
                                                                              .allergiesCopy
                                                                              .where((e) => e.type == currentLoop1Item)
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.severity
                                                                          : UserAllergySeverity.mild,
                                                                    ));
                                                          }
                                                          _model.allergiesCopy =
                                                              _model.allergies
                                                                  .toList()
                                                                  .cast<
                                                                      AllergyStruct>();
                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final medicalAllergies =
                                                        _model.allergies
                                                            .toList();

                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          medicalAllergies
                                                              .length,
                                                          (medicalAllergiesIndex) {
                                                        final medicalAllergiesItem =
                                                            medicalAllergies[
                                                                medicalAllergiesIndex];
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                    esText: () {
                                                                      if (medicalAllergiesItem
                                                                              .type ==
                                                                          UserAllergyType
                                                                              .food) {
                                                                        return 'Comida';
                                                                      } else if (medicalAllergiesItem
                                                                              .type ==
                                                                          UserAllergyType
                                                                              .medication) {
                                                                        return 'Medicina';
                                                                      } else if (medicalAllergiesItem
                                                                              .type ==
                                                                          UserAllergyType
                                                                              .animal) {
                                                                        return 'Animal';
                                                                      } else if (medicalAllergiesItem
                                                                              .type ==
                                                                          UserAllergyType
                                                                              .latex) {
                                                                        return 'Latex';
                                                                      } else if (medicalAllergiesItem
                                                                              .type ==
                                                                          UserAllergyType
                                                                              .food) {
                                                                        return 'Polen';
                                                                      } else {
                                                                        return 'Otro';
                                                                      }
                                                                    }(),
                                                                    enText: () {
                                                                      if (medicalAllergiesItem
                                                                              .type ==
                                                                          UserAllergyType
                                                                              .food) {
                                                                        return 'Meal';
                                                                      } else if (medicalAllergiesItem
                                                                              .type ==
                                                                          UserAllergyType
                                                                              .medication) {
                                                                        return 'Medicine';
                                                                      } else if (medicalAllergiesItem
                                                                              .type ==
                                                                          UserAllergyType
                                                                              .animal) {
                                                                        return 'Animal';
                                                                      } else if (medicalAllergiesItem
                                                                              .type ==
                                                                          UserAllergyType
                                                                              .latex) {
                                                                        return 'Latex';
                                                                      } else if (medicalAllergiesItem
                                                                              .type ==
                                                                          UserAllergyType
                                                                              .food) {
                                                                        return 'Pollen';
                                                                      } else {
                                                                        return 'Other';
                                                                      }
                                                                    }(),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                wrapWithModel(
                                                                  model: _model
                                                                      .allergySeverityModels
                                                                      .getModel(
                                                                    medicalAllergiesItem
                                                                        .type!
                                                                        .name,
                                                                    medicalAllergiesIndex,
                                                                  ),
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  updateOnChange:
                                                                      true,
                                                                  child:
                                                                      AllergySeverityWidget(
                                                                    key: Key(
                                                                      'Keyvt5_${medicalAllergiesItem.type!.name}',
                                                                    ),
                                                                    init: medicalAllergiesItem.severity !=
                                                                            null
                                                                        ? medicalAllergiesItem
                                                                            .severity
                                                                        : UserAllergySeverity
                                                                            .mild,
                                                                    action:
                                                                        (value) async {
                                                                      _model
                                                                          .updateAllergiesAtIndex(
                                                                        medicalAllergiesIndex,
                                                                        (e) => e
                                                                          ..severity =
                                                                              value,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      10.0)),
                                                            ),
                                                          ),
                                                        );
                                                      }).divide(SizedBox(
                                                          height: 8.0)),
                                                    );
                                                  },
                                                ),
                                              ].divide(SizedBox(height: 10.0)),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Container(
                                          width: 0.0,
                                          height: 0.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'm7hkx13p' /* ¿Sufre alguna enfermedad? */,
                                          ),
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
                                      Switch.adaptive(
                                        value: _model.hasConditionsValue!,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .hasConditionsValue = newValue);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context).info,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context).info,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (_model.hasConditionsValue ?? false) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.addToConditions(
                                                    MedicalObservationStruct());
                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '8ju4kyjm' /* Agregar Condicion Medica */,
                                              ),
                                              icon: Icon(
                                                Icons
                                                    .medical_information_rounded,
                                                size: 28.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    final medicalConditions =
                                                        _model.conditions
                                                            .toList();

                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          medicalConditions
                                                              .length,
                                                          (medicalConditionsIndex) {
                                                        final medicalConditionsItem =
                                                            medicalConditions[
                                                                medicalConditionsIndex];
                                                        return Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              12.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      wrapWithModel(
                                                                        model: _model
                                                                            .customInputModels1
                                                                            .getModel(
                                                                          '${medicalConditionsIndex.toString()}${medicalConditionsItem.name}',
                                                                          medicalConditionsIndex,
                                                                        ),
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        updateOnChange:
                                                                            true,
                                                                        child:
                                                                            CustomInputWidget(
                                                                          key:
                                                                              Key(
                                                                            'Keyngo_${'${medicalConditionsIndex.toString()}${medicalConditionsItem.name}'}',
                                                                          ),
                                                                          init:
                                                                              medicalConditionsItem.name,
                                                                          label:
                                                                              'Nombre',
                                                                          hint:
                                                                              'Nombre de la enfermedad',
                                                                          action:
                                                                              (value) async {
                                                                            _model.updateConditionsAtIndex(
                                                                              medicalConditionsIndex,
                                                                              (e) => e..name = value,
                                                                            );
                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                      ),
                                                                      wrapWithModel(
                                                                        model: _model
                                                                            .customInputModels2
                                                                            .getModel(
                                                                          '${medicalConditionsIndex.toString()}_${medicalConditionsItem.name}',
                                                                          medicalConditionsIndex,
                                                                        ),
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        updateOnChange:
                                                                            true,
                                                                        child:
                                                                            CustomInputWidget(
                                                                          key:
                                                                              Key(
                                                                            'Key1s2_${'${medicalConditionsIndex.toString()}_${medicalConditionsItem.name}'}',
                                                                          ),
                                                                          init:
                                                                              medicalConditionsItem.note,
                                                                          label:
                                                                              'Detalles',
                                                                          hint:
                                                                              'Detalles de la enfermedad',
                                                                          action:
                                                                              (value) async {
                                                                            _model.updateConditionsAtIndex(
                                                                              medicalConditionsIndex,
                                                                              (e) => e..note = value,
                                                                            );
                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    32.0,
                                                                buttonSize:
                                                                    30.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                icon: Icon(
                                                                  Icons.close,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 14.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  _model.removeAtIndexFromConditions(
                                                                      medicalConditionsIndex);
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      }).divide(SizedBox(
                                                          height: 8.0)),
                                                    );
                                                  },
                                                ),
                                              ].divide(SizedBox(height: 10.0)),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Container(
                                          width: 0.0,
                                          height: 0.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'c75jrjku' /* ¿Consume algún tipo de medicam... */,
                                          ),
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
                                      Switch.adaptive(
                                        value: _model.hasMedicationsValue!,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .hasMedicationsValue = newValue);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context).info,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context).info,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (_model.hasMedicationsValue ?? false) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    _model.addToMedications(
                                                        MedicalObservationStruct());
                                                    safeSetState(() {});
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'qtc5oq45' /* Agregar Medicamento */,
                                                  ),
                                                  icon: Icon(
                                                    Icons.medication_liquid,
                                                    size: 28.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .interTight(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                            ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final medicalMedications =
                                                        _model.medications
                                                            .toList();

                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          medicalMedications
                                                              .length,
                                                          (medicalMedicationsIndex) {
                                                        final medicalMedicationsItem =
                                                            medicalMedications[
                                                                medicalMedicationsIndex];
                                                        return Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              12.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      wrapWithModel(
                                                                        model: _model
                                                                            .customInputModels3
                                                                            .getModel(
                                                                          '${medicalMedicationsIndex.toString()}${medicalMedicationsItem.name}',
                                                                          medicalMedicationsIndex,
                                                                        ),
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            CustomInputWidget(
                                                                          key:
                                                                              Key(
                                                                            'Keye15_${'${medicalMedicationsIndex.toString()}${medicalMedicationsItem.name}'}',
                                                                          ),
                                                                          init:
                                                                              medicalMedicationsItem.name,
                                                                          label:
                                                                              'Nombre',
                                                                          hint:
                                                                              'Nombre del medicamento',
                                                                          action:
                                                                              (value) async {
                                                                            _model.updateMedicationsAtIndex(
                                                                              medicalMedicationsIndex,
                                                                              (e) => e..name = value,
                                                                            );
                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                      ),
                                                                      wrapWithModel(
                                                                        model: _model
                                                                            .customInputModels4
                                                                            .getModel(
                                                                          '${medicalMedicationsIndex.toString()}_${medicalMedicationsItem.name}',
                                                                          medicalMedicationsIndex,
                                                                        ),
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            CustomInputWidget(
                                                                          key:
                                                                              Key(
                                                                            'Keyr7c_${'${medicalMedicationsIndex.toString()}_${medicalMedicationsItem.name}'}',
                                                                          ),
                                                                          init:
                                                                              medicalMedicationsItem.note,
                                                                          label:
                                                                              'Detalles',
                                                                          hint:
                                                                              'Dosis y Frecuencia',
                                                                          action:
                                                                              (value) async {
                                                                            _model.updateMedicationsAtIndex(
                                                                              medicalMedicationsIndex,
                                                                              (e) => e..note = value,
                                                                            );
                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    32.0,
                                                                buttonSize:
                                                                    30.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                icon: Icon(
                                                                  Icons.close,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 14.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  _model.removeAtIndexFromMedications(
                                                                      medicalMedicationsIndex);
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      }).divide(SizedBox(
                                                          height: 8.0)),
                                                    );
                                                  },
                                                ),
                                              ].divide(SizedBox(height: 10.0)),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Container(
                                          width: 0.0,
                                          height: 0.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                              Container(),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: FFButtonWidget(
                      onPressed: ((_model
                                          .displaynameTextController.text ==
                                      '') ||
                              (_model.identityDocumentTextController
                                          .text ==
                                      '') ||
                              ((_model.uploadedLocalFile_frontImage.bytes
                                          ?.isEmpty ??
                                      true)) ||
                              (_model.genderValue == null) ||
                              (_model
                                          .addressDetailsTextController.text ==
                                      '') ||
                              (_model.birthdateModel.textController.text ==
                                      '') ||
                              (_model.bloodTypeValue == null))
                          ? null
                          : () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if ((_model.uploadedLocalFile_frontImage.bytes ??
                                          [])
                                      .isEmpty) {
                                return;
                              }
                              if (_model.bloodTypeValue == null) {
                                return;
                              }
                              if (_model.genderValue == null) {
                                return;
                              }
                              {
                                safeSetState(() => _model
                                    .isDataUploading_uploadFrontImage = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];
                                var selectedMedia = <SelectedFile>[];
                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = _model
                                          .uploadedLocalFile_frontImage
                                          .bytes!
                                          .isNotEmpty
                                      ? [_model.uploadedLocalFile_frontImage]
                                      : <FFUploadedFile>[];
                                  selectedMedia =
                                      selectedFilesFromUploadedFiles(
                                    selectedUploadedFiles,
                                  );
                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading_uploadFrontImage =
                                      false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_uploadFrontImage =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl_uploadFrontImage =
                                        downloadUrls.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              await currentUserReference!.update({
                                ...createUsersRecordData(
                                  displayName:
                                      _model.displaynameTextController.text,
                                  phoneNumber:
                                      '${_model.phoneNumberModel.dialCodeTextController.text}${_model.phoneNumberModel.dialNumberTextController.text}',
                                  status: UserStatus.pending_validation,
                                  nationality: FFAppState().nationality,
                                  gender: _model.genderValue,
                                  birthDate: _model.birthdateModel.datePicked,
                                  identityDocument:
                                      updateIdentityDocumentStruct(
                                    IdentityDocumentStruct(
                                      type: UserIdentityDocument.dni,
                                      number: _model
                                          .identityDocumentTextController.text,
                                      frontImage: _model
                                          .uploadedFileUrl_uploadFrontImage,
                                    ),
                                    clearUnsetFields: false,
                                  ),
                                  medicalInformation:
                                      updateMedicalInformationStruct(
                                    MedicalInformationStruct(
                                      allergies: _model.allergies,
                                      conditions: _model.conditions,
                                      medications: _model.medications,
                                      disabilities: _model.disabilities,
                                      bloodType: _model.bloodTypeValue,
                                    ),
                                    clearUnsetFields: false,
                                  ),
                                  platformRol: PlatformProfile.citizen,
                                ),
                                ...mapToFirestore(
                                  {
                                    'emergencyContacts': FieldValue.arrayUnion([
                                      getContactFirestoreData(
                                        createContactStruct(
                                          name: _model
                                              .emergencyNameTextController.text,
                                          relationship:
                                              _model.relationshipValue,
                                          phoneNumber:
                                              '${_model.emergencyPhoneNumberModel.dialCodeTextController.text}${_model.emergencyPhoneNumberModel.dialNumberTextController.text}',
                                          email: _model
                                              .emergencyEmailTextController
                                              .text,
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                    'addresses': FieldValue.arrayUnion([
                                      getLocationFirestoreData(
                                        updateLocationStruct(
                                          LocationStruct(
                                            name: _model.locationValue.name,
                                            address:
                                                _model.locationValue.address,
                                            city: _model.locationValue.city,
                                            state: _model.locationValue.state,
                                            country:
                                                _model.locationValue.country,
                                            zipCode:
                                                _model.locationValue.zipCode,
                                            zone: ZoneStruct(
                                              geopoint:
                                                  _model.locationValue.latLng,
                                            ),
                                            note: _model
                                                .addressDetailsTextController
                                                .text,
                                          ),
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });
                            },
                      text: FFLocalizations.of(context).getText(
                        'y85xyo38' /* Registar Usuario */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
