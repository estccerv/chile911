import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/admin/chats_management_content/chats_management_content_widget.dart';
import '/profile_management/page_squema/page_squema_widget.dart';
import 'package:flutter/material.dart';
import 'chats_management_model.dart';
export 'chats_management_model.dart';

class ChatsManagementWidget extends StatefulWidget {
  const ChatsManagementWidget({super.key});

  static String routeName = 'chatsManagement';
  static String routePath = '/chatsManagement';

  @override
  State<ChatsManagementWidget> createState() => _ChatsManagementWidgetState();
}

class _ChatsManagementWidgetState extends State<ChatsManagementWidget> {
  late ChatsManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatsManagementModel());

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
              page: AppAdminPages.chatsManagement.name,
              content: () => ChatsManagementContentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
