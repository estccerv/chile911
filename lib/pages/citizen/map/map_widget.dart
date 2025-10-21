import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/citizen/map_content/map_content_widget.dart';
import '/profile_management/page_squema/page_squema_widget.dart';
import 'package:flutter/material.dart';
import 'map_model.dart';
export 'map_model.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  static String routeName = 'Map';
  static String routePath = '/map';

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late MapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.pageSquemaModel,
            updateCallback: () => safeSetState(() {}),
            child: PageSquemaWidget(
              page: AppCitizenPages.map.name,
              content: () => MapContentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
