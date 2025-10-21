import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/admin/platform_management_content/platform_management_content_widget.dart';
import '/profile_management/page_squema/page_squema_widget.dart';
import 'package:flutter/material.dart';
import 'platform_management_model.dart';
export 'platform_management_model.dart';

class PlatformManagementWidget extends StatefulWidget {
  const PlatformManagementWidget({super.key});

  static String routeName = 'platformManagement';
  static String routePath = '/platformManagement';

  @override
  State<PlatformManagementWidget> createState() =>
      _PlatformManagementWidgetState();
}

class _PlatformManagementWidgetState extends State<PlatformManagementWidget> {
  late PlatformManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlatformManagementModel());

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
              page: AppAdminPages.PlatformManagement.name,
              content: () => PlatformManagementContentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
