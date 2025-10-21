import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/admin/global_dashboard_content/global_dashboard_content_widget.dart';
import '/profile_management/page_squema/page_squema_widget.dart';
import 'package:flutter/material.dart';
import 'global_dashboard_model.dart';
export 'global_dashboard_model.dart';

class GlobalDashboardWidget extends StatefulWidget {
  const GlobalDashboardWidget({super.key});

  static String routeName = 'globalDashboard';
  static String routePath = '/globalDashboard';

  @override
  State<GlobalDashboardWidget> createState() => _GlobalDashboardWidgetState();
}

class _GlobalDashboardWidgetState extends State<GlobalDashboardWidget> {
  late GlobalDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlobalDashboardModel());

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
              page: AppAdminPages.GlobalDashboard.name,
              content: () => GlobalDashboardContentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
