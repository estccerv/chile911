import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'view_image_model.dart';
export 'view_image_model.dart';

/// Create a component view photo widget
class ViewImageWidget extends StatefulWidget {
  const ViewImageWidget({
    super.key,
    required this.imageFile,
  });

  final FFUploadedFile? imageFile;

  @override
  State<ViewImageWidget> createState() => _ViewImageWidgetState();
}

class _ViewImageWidgetState extends State<ViewImageWidget> {
  late ViewImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewImageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          ClipRect(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 22.0,
                sigmaY: 11.0,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.memory(
                  widget.imageFile?.bytes ?? Uint8List.fromList([]),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0x3F000000),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.memory(
              widget.imageFile?.bytes ?? Uint8List.fromList([]),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 32.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).primary,
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).info,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
