import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'map_content_model.dart';
export 'map_content_model.dart';

class MapContentWidget extends StatefulWidget {
  const MapContentWidget({super.key});

  @override
  State<MapContentWidget> createState() => _MapContentWidgetState();
}

class _MapContentWidgetState extends State<MapContentWidget> {
  late MapContentModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapContentModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return StreamBuilder<List<InstitutionsRecord>>(
      stream: queryInstitutionsRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<InstitutionsRecord> googleMapInstitutionsRecordList =
            snapshot.data!;

        return FlutterFlowGoogleMap(
          controller: _model.googleMapsController,
          onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
          initialLocation: _model.googleMapsCenter ??=
              currentUserLocationValue!,
          markers: googleMapInstitutionsRecordList
              .map((e) => e.locations.firstOrNull?.zone.geopoint)
              .withoutNulls
              .toList()
              .map(
                (marker) => FlutterFlowMarker(
                  marker.serialize(),
                  marker,
                ),
              )
              .toList(),
          markerColor: GoogleMarkerColor.violet,
          mapType: MapType.normal,
          style: GoogleMapStyle.standard,
          initialZoom: 14.0,
          allowInteraction: true,
          allowZoom: true,
          showZoomControls: true,
          showLocation: true,
          showCompass: true,
          showMapToolbar: false,
          showTraffic: false,
          centerMapOnMarkerTap: true,
          mapTakesGesturePreference: false,
        );
      },
    );
  }
}
