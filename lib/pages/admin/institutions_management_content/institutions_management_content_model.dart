import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'institutions_management_content_widget.dart'
    show InstitutionsManagementContentWidget;
import 'package:flutter/material.dart';

class InstitutionsManagementContentModel
    extends FlutterFlowModel<InstitutionsManagementContentWidget> {
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
