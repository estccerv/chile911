import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'map_content_widget.dart' show MapContentWidget;
import 'package:flutter/material.dart';

class MapContentModel extends FlutterFlowModel<MapContentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
