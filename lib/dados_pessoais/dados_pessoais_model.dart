import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dados_pessoais_widget.dart' show DadosPessoaisWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DadosPessoaisModel extends FlutterFlowModel<DadosPessoaisWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for idade widget.
  FocusNode? idadeFocusNode;
  TextEditingController? idadeTextController;
  String? Function(BuildContext, String?)? idadeTextControllerValidator;
  // State field(s) for sexo widget.
  String? sexoValue;
  FormFieldController<String>? sexoValueController;
  // State field(s) for estadoCivil widget.
  String? estadoCivilValue;
  FormFieldController<String>? estadoCivilValueController;
  // State field(s) for CPFdconjuge widget.
  FocusNode? cPFdconjugeFocusNode;
  TextEditingController? cPFdconjugeTextController;
  final cPFdconjugeMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cPFdconjugeTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsuarioRow>? user;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    idadeFocusNode?.dispose();
    idadeTextController?.dispose();

    cPFdconjugeFocusNode?.dispose();
    cPFdconjugeTextController?.dispose();
  }
}
