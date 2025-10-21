import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'global_dashboard_content_widget.dart' show GlobalDashboardContentWidget;
import 'package:flutter/material.dart';

class GlobalDashboardContentModel
    extends FlutterFlowModel<GlobalDashboardContentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<InstitutionsRecord>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
