import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile_management/nav_bar/nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'side_bar_model.dart';
export 'side_bar_model.dart';

class SideBarWidget extends StatefulWidget {
  const SideBarWidget({
    super.key,
    required this.currentPage,
  });

  final String? currentPage;

  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  late SideBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideBarModel());

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
      height: MediaQuery.sizeOf(context).height * 1.0,
      constraints: BoxConstraints(
        maxWidth: 220.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarWidget(
                        isHorizontal: false,
                        currentPage: widget.currentPage!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ].divide(SizedBox(height: 12.0)).around(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
