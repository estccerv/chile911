import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'logo_model.dart';
export 'logo_model.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget({super.key});

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  late LogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoModel());

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'assets/images/b54d4355-c83a-4218-bceb-457a78e184e9_removalai_preview.png',
          height: 150.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
