import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/institutional/institution_management_content/institution_management_content_widget.dart';
import '/profile_management/page_squema/page_squema_widget.dart';
import 'package:flutter/material.dart';
import 'institution_management_model.dart';
export 'institution_management_model.dart';

class InstitutionManagementWidget extends StatefulWidget {
  const InstitutionManagementWidget({super.key});

  static String routeName = 'institutionManagement';
  static String routePath = '/institutionManagement';

  @override
  State<InstitutionManagementWidget> createState() =>
      _InstitutionManagementWidgetState();
}

class _InstitutionManagementWidgetState
    extends State<InstitutionManagementWidget> {
  late InstitutionManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstitutionManagementModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.pageSquemaModel,
            updateCallback: () => safeSetState(() {}),
            child: PageSquemaWidget(
              page: AppCitizenPages.profile.name,
              content: () => InstitutionManagementContentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
