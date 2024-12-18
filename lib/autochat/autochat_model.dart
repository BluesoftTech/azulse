import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'autochat_widget.dart' show AutochatWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AutochatModel extends FlutterFlowModel<AutochatWidget> {
  ///  Local state fields for this page.

  bool typing = false;

  bool p1 = true;

  bool p2 = false;

  bool p3 = false;

  bool p4 = false;

  bool p5 = false;

  bool p6 = false;

  bool p7 = false;

  bool p8 = false;

  bool p9 = false;

  String? nome;

  bool p10 = false;

  String? resposta1;

  bool botaoPorte = false;

  bool dissenao = false;

  ///  State fields for stateful widgets in this page.

  Completer<List<MensagensRow>>? requestCompleter;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for mensagens widget.
  ScrollController? mensagens;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;
  AudioPlayer? soundPlayer6;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    mensagens = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
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
