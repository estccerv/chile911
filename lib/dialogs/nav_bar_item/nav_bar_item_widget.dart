import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nav_bar_item_model.dart';
export 'nav_bar_item_model.dart';

class NavBarItemWidget extends StatefulWidget {
  const NavBarItemWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.isHorizontal,
  });

  final Widget? icon;
  final String? label;
  final Color? color;
  final bool? isHorizontal;

  @override
  State<NavBarItemWidget> createState() => _NavBarItemWidgetState();
}

class _NavBarItemWidgetState extends State<NavBarItemWidget> {
  late NavBarItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarItemModel());

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
      width: double.infinity,
      height: 70.0,
      constraints: BoxConstraints(
        maxWidth: 90.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: Flex(
          direction: !widget.isHorizontal! ? Axis.horizontal : Axis.vertical,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(6.0),
              child: widget.icon!,
            ),
            Flexible(
              child: Text(
                valueOrDefault<String>(
                  widget.label,
                  'Item',
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: widget.color,
                      fontSize: 10.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
