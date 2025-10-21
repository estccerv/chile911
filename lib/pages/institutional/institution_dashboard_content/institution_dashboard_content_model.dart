import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'institution_dashboard_content_widget.dart'
    show InstitutionDashboardContentWidget;
import 'package:flutter/material.dart';

class InstitutionDashboardContentModel
    extends FlutterFlowModel<InstitutionDashboardContentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<AlertsRecord>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
