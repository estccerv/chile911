import '/components/basic_settings/basic_settings_widget.dart';
import '/components/logo/logo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'entry_widget.dart' show EntryWidget;
import 'package:flutter/material.dart';

class EntryModel extends FlutterFlowModel<EntryWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for logo component.
  late LogoModel logoModel;
  // Model for basicSettings component.
  late BasicSettingsModel basicSettingsModel;

  @override
  void initState(BuildContext context) {
    logoModel = createModel(context, () => LogoModel());
    basicSettingsModel = createModel(context, () => BasicSettingsModel());
  }

  @override
  void dispose() {
    logoModel.dispose();
    basicSettingsModel.dispose();
  }
}
