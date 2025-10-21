import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/admin/users_management_content/users_management_content_widget.dart';
import '/profile_management/page_squema/page_squema_widget.dart';
import 'package:flutter/material.dart';
import 'users_management_model.dart';
export 'users_management_model.dart';

class UsersManagementWidget extends StatefulWidget {
  const UsersManagementWidget({super.key});

  static String routeName = 'usersManagement';
  static String routePath = '/usersManagement';

  @override
  State<UsersManagementWidget> createState() => _UsersManagementWidgetState();
}

class _UsersManagementWidgetState extends State<UsersManagementWidget> {
  late UsersManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsersManagementModel());

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
              page: AppAdminPages.usersManagement.name,
              content: () => UsersManagementContentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
