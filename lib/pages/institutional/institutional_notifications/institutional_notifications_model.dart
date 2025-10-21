import '/flutter_flow/flutter_flow_util.dart';
import '/profile_management/page_squema/page_squema_widget.dart';
import 'institutional_notifications_widget.dart'
    show InstitutionalNotificationsWidget;
import 'package:flutter/material.dart';

class InstitutionalNotificationsModel
    extends FlutterFlowModel<InstitutionalNotificationsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for pageSquema component.
  late PageSquemaModel pageSquemaModel;

  @override
  void initState(BuildContext context) {
    pageSquemaModel = createModel(context, () => PageSquemaModel());
  }

  @override
  void dispose() {
    pageSquemaModel.dispose();
  }
}
