import '/flutter_flow/flutter_flow_util.dart';
import '/profile_management/page_squema/page_squema_widget.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
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
