import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'icon_model.dart';
export 'icon_model.dart';

class IconWidget extends StatefulWidget {
  const IconWidget({
    super.key,
    required this.icon,
    bool? selected,
  }) : this.selected = selected ?? false;

  final Widget? icon;
  final bool selected;

  @override
  State<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  late IconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
