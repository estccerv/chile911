import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/institutional/institution_alerts_content/institution_alerts_content_widget.dart';
import '/profile_management/page_squema/page_squema_widget.dart';
import 'package:flutter/material.dart';
import 'institution_alerts_model.dart';
export 'institution_alerts_model.dart';

class InstitutionAlertsWidget extends StatefulWidget {
  const InstitutionAlertsWidget({super.key});

  static String routeName = 'institutionAlerts';
  static String routePath = '/institutionAlerts';

  @override
  State<InstitutionAlertsWidget> createState() =>
      _InstitutionAlertsWidgetState();
}

class _InstitutionAlertsWidgetState extends State<InstitutionAlertsWidget> {
  late InstitutionAlertsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstitutionAlertsModel());

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
              page: AppInstitutionalPages.institutionAlerts.name,
              content: () => InstitutionAlertsContentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
