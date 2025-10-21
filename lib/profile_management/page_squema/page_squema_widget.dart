import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile_management/header/header_widget.dart';
import '/profile_management/nav_bar/nav_bar_widget.dart';
import '/profile_management/side_bar/side_bar_widget.dart';
import 'package:flutter/material.dart';
import 'page_squema_model.dart';
export 'page_squema_model.dart';

class PageSquemaWidget extends StatefulWidget {
  const PageSquemaWidget({
    super.key,
    required this.content,
    required this.page,
  });

  final Widget Function()? content;
  final String? page;

  @override
  State<PageSquemaWidget> createState() => _PageSquemaWidgetState();
}

class _PageSquemaWidgetState extends State<PageSquemaWidget> {
  late PageSquemaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageSquemaModel());

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
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          wrapWithModel(
            model: _model.headerModel,
            updateCallback: () => safeSetState(() {}),
            child: HeaderWidget(),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                ))
                  wrapWithModel(
                    model: _model.sideBarModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: SideBarWidget(
                      currentPage: widget.page!,
                    ),
                  ),
                Expanded(
                  child: Builder(builder: (_) {
                    return widget.content != null
                        ? widget.content!()
                        : SizedBox.shrink();
                  }),
                ),
              ],
            ),
          ),
          if (responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ))
            wrapWithModel(
              model: _model.navBarModel,
              updateCallback: () => safeSetState(() {}),
              updateOnChange: true,
              child: NavBarWidget(
                currentPage: widget.page!,
                isHorizontal: true,
              ),
            ),
        ],
      ),
    );
  }
}
