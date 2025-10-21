import '/flutter_flow/flutter_flow_util.dart';
import '/profile_management/header/header_widget.dart';
import '/profile_management/nav_bar/nav_bar_widget.dart';
import '/profile_management/side_bar/side_bar_widget.dart';
import 'page_squema_widget.dart' show PageSquemaWidget;
import 'package:flutter/material.dart';

class PageSquemaModel extends FlutterFlowModel<PageSquemaWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for header component.
  late HeaderModel headerModel;
  // Model for sideBar component.
  late SideBarModel sideBarModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    sideBarModel = createModel(context, () => SideBarModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    sideBarModel.dispose();
    navBarModel.dispose();
  }
}
