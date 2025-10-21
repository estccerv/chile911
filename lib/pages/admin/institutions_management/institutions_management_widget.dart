import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/admin/institutions_management_content/institutions_management_content_widget.dart';
import '/profile_management/page_squema/page_squema_widget.dart';
import 'package:flutter/material.dart';
import 'institutions_management_model.dart';
export 'institutions_management_model.dart';

class InstitutionsManagementWidget extends StatefulWidget {
  const InstitutionsManagementWidget({super.key});

  static String routeName = 'institutionsManagement';
  static String routePath = '/institutionsManagement';

  @override
  State<InstitutionsManagementWidget> createState() =>
      _InstitutionsManagementWidgetState();
}

class _InstitutionsManagementWidgetState
    extends State<InstitutionsManagementWidget> {
  late InstitutionsManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstitutionsManagementModel());

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
              page: AppAdminPages.institutionsManagement.name,
              content: () => InstitutionsManagementContentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
