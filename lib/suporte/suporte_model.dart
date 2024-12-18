import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'suporte_widget.dart' show SuporteWidget;
import 'package:flutter/material.dart';

class SuporteModel extends FlutterFlowModel<SuporteWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for mensagens widget.
  ScrollController? mensagens;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<List<MensagensRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {
    mensagens = ScrollController();
  }

  @override
  void dispose() {
    mensagens?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
