import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/institutional/institutional_chat_content/institutional_chat_content_widget.dart';
import '/profile_management/page_squema/page_squema_widget.dart';
import 'package:flutter/material.dart';
import 'institutional_chat_model.dart';
export 'institutional_chat_model.dart';

class InstitutionalChatWidget extends StatefulWidget {
  const InstitutionalChatWidget({super.key});

  static String routeName = 'institutionalChat';
  static String routePath = '/institutionalChat';

  @override
  State<InstitutionalChatWidget> createState() =>
      _InstitutionalChatWidgetState();
}

class _InstitutionalChatWidgetState extends State<InstitutionalChatWidget> {
  late InstitutionalChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstitutionalChatModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.pageSquemaModel,
            updateCallback: () => safeSetState(() {}),
            child: PageSquemaWidget(
              page: AppInstitutionalPages.InstitutionalChat.name,
              content: () => InstitutionalChatContentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
