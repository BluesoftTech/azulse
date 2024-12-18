import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  bool typing = false;

  bool p1 = true;

  bool p2 = false;

  bool p3 = false;

  bool p4 = false;

  bool p5 = false;

  bool p6 = false;

  String? nome;

  String? resposta1;

  bool botaoPorte = false;

  bool audioOK = false;

  bool formBasic = false;

  String? porte;

  bool marcarReuniao = false;

  bool topo = false;

  bool melhorNao = false;

  bool nao = false;

  bool preencher = false;

  ///  State fields for stateful widgets in this page.

  Completer<List<MensagensRow>>? requestCompleter;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for mensagens widget.
  ScrollController? mensagens;
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // State field(s) for cpf widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  final cpfMask = MaskTextInputFormatter(
      mask: '###.###.###-##, ###.###.###-##, ###.###.###-##, ###.###.###-##');
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  // State field(s) for contato widget.
  FocusNode? contatoFocusNode;
  TextEditingController? contatoTextController;
  final contatoMask = MaskTextInputFormatter(mask: '55 (##) #####-####');
  String? Function(BuildContext, String?)? contatoTextControllerValidator;
  // State field(s) for nomeEmpresa widget.
  FocusNode? nomeEmpresaFocusNode;
  TextEditingController? nomeEmpresaTextController;
  String? Function(BuildContext, String?)? nomeEmpresaTextControllerValidator;
  // State field(s) for cnpj widget.
  FocusNode? cnpjFocusNode;
  TextEditingController? cnpjTextController;
  final cnpjMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? cnpjTextControllerValidator;
  // State field(s) for porte widget.
  String? porteValue;
  FormFieldController<String>? porteValueController;
  // State field(s) for tempo widget.
  String? tempoValue;
  FormFieldController<String>? tempoValueController;
  // State field(s) for faturamento widget.
  String? faturamentoValue;
  FormFieldController<String>? faturamentoValueController;
  // State field(s) for creditoIdeal widget.
  String? creditoIdealValue;
  FormFieldController<String>? creditoIdealValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    mensagens = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    mensagens?.dispose();
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    contatoFocusNode?.dispose();
    contatoTextController?.dispose();

    nomeEmpresaFocusNode?.dispose();
    nomeEmpresaTextController?.dispose();

    cnpjFocusNode?.dispose();
    cnpjTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();
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
