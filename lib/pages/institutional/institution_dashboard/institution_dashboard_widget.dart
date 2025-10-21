import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/institutional/institution_dashboard_content/institution_dashboard_content_widget.dart';
import '/profile_management/page_squema/page_squema_widget.dart';
import 'package:flutter/material.dart';
import 'institution_dashboard_model.dart';
export 'institution_dashboard_model.dart';

class InstitutionDashboardWidget extends StatefulWidget {
  const InstitutionDashboardWidget({super.key});

  static String routeName = 'institutionDashboard';
  static String routePath = '/institutionDashboard';

  @override
  State<InstitutionDashboardWidget> createState() =>
      _InstitutionDashboardWidgetState();
}

class _InstitutionDashboardWidgetState
    extends State<InstitutionDashboardWidget> {
  late InstitutionDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstitutionDashboardModel());

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
              page: AppInstitutionalPages.institutionDashboard.name,
              content: () => InstitutionDashboardContentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
