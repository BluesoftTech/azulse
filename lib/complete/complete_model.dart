import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'complete_widget.dart' show CompleteWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CompleteModel extends FlutterFlowModel<CompleteWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for NomeCompleto widget.
  FocusNode? nomeCompletoFocusNode;
  TextEditingController? nomeCompletoTextController;
  String? Function(BuildContext, String?)? nomeCompletoTextControllerValidator;
  // State field(s) for Contato widget.
  FocusNode? contatoFocusNode;
  TextEditingController? contatoTextController;
  final contatoMask = MaskTextInputFormatter(mask: '###########');
  String? Function(BuildContext, String?)? contatoTextControllerValidator;
  // State field(s) for cpf widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  final cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsuarioRow>? userDatas;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeCompletoFocusNode?.dispose();
    nomeCompletoTextController?.dispose();

    contatoFocusNode?.dispose();
    contatoTextController?.dispose();

    cpfFocusNode?.dispose();
    cpfTextController?.dispose();
  }
}
