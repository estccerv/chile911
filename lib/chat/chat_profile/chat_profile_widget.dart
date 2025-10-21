import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_profile_model.dart';
export 'chat_profile_model.dart';

class ChatProfileWidget extends StatefulWidget {
  const ChatProfileWidget({
    super.key,
    this.photo,
    this.title,
    this.subTitle,
  });

  final String? photo;
  final String? title;
  final String? subTitle;

  @override
  State<ChatProfileWidget> createState() => _ChatProfileWidgetState();
}

class _ChatProfileWidgetState extends State<ChatProfileWidget> {
  late ChatProfileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatProfileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 180.0,
            height: 180.0,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              getCORSProxyUrl(
                valueOrDefault<String>(
                  widget.photo,
                  'https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg',
                ),
              ),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            valueOrDefault<String>(
              widget.title,
              'Nombre',
            ),
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                ),
          ),
          if (widget.subTitle != null && widget.subTitle != '')
            Text(
              valueOrDefault<String>(
                widget.subTitle,
                'subTitle',
              ),
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    font: GoogleFonts.interTight(
                      fontWeight:
                          FlutterFlowTheme.of(context).titleMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).titleMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleMedium.fontStyle,
                  ),
            ),
        ].divide(SizedBox(height: 2.0)),
      ),
    );
  }
}
