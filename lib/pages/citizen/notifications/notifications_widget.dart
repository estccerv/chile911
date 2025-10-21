import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/citizen/notifications_content/notifications_content_widget.dart';
import '/profile_management/page_squema/page_squema_widget.dart';
import 'package:flutter/material.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  static String routeName = 'notifications';
  static String routePath = '/notifications';

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

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
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.pageSquemaModel,
            updateCallback: () => safeSetState(() {}),
            child: PageSquemaWidget(
              page: AppCitizenPages.notifications.name,
              content: () => NotificationsContentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
