import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_content_widget.dart' show NotificationsContentWidget;
import 'package:flutter/material.dart';

class NotificationsContentModel
    extends FlutterFlowModel<NotificationsContentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
