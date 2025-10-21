import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/institutional/institutional_notifications_content/institutional_notifications_content_widget.dart';
import '/profile_management/page_squema/page_squema_widget.dart';
import 'package:flutter/material.dart';
import 'institutional_notifications_model.dart';
export 'institutional_notifications_model.dart';

class InstitutionalNotificationsWidget extends StatefulWidget {
  const InstitutionalNotificationsWidget({super.key});

  static String routeName = 'institutionalNotifications';
  static String routePath = '/institutionalNotifications';

  @override
  State<InstitutionalNotificationsWidget> createState() =>
      _InstitutionalNotificationsWidgetState();
}

class _InstitutionalNotificationsWidgetState
    extends State<InstitutionalNotificationsWidget> {
  late InstitutionalNotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstitutionalNotificationsModel());

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
              page: AppInstitutionalPages.InstitutionalNotifications.name,
              content: () => InstitutionalNotificationsContentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
