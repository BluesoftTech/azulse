import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dados_empresariais_widget.dart' show DadosEmpresariaisWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DadosEmpresariaisModel extends FlutterFlowModel<DadosEmpresariaisWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RazaoSocial widget.
  FocusNode? razaoSocialFocusNode;
  TextEditingController? razaoSocialTextController;
  String? Function(BuildContext, String?)? razaoSocialTextControllerValidator;
  // State field(s) for CNPJ widget.
  FocusNode? cnpjFocusNode;
  TextEditingController? cnpjTextController;
  final cnpjMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? cnpjTextControllerValidator;
  // State field(s) for classeCNPJ widget.
  String? classeCNPJValue;
  FormFieldController<String>? classeCNPJValueController;
  // State field(s) for possuisocios widget.
  String? possuisociosValue;
  FormFieldController<String>? possuisociosValueController;
  // State field(s) for Faturamento widget.
  FocusNode? faturamentoFocusNode;
  TextEditingController? faturamentoTextController;
  String? Function(BuildContext, String?)? faturamentoTextControllerValidator;
  // State field(s) for CPFdossocios widget.
  FocusNode? cPFdossociosFocusNode;
  TextEditingController? cPFdossociosTextController;
  String? Function(BuildContext, String?)? cPFdossociosTextControllerValidator;
  // State field(s) for sociosConjuge widget.
  String? sociosConjugeValue;
  FormFieldController<String>? sociosConjugeValueController;
  // State field(s) for CPFconjugeSocios widget.
  FocusNode? cPFconjugeSociosFocusNode;
  TextEditingController? cPFconjugeSociosTextController;
  String? Function(BuildContext, String?)?
      cPFconjugeSociosTextControllerValidator;
  // State field(s) for sociosTemRestri widget.
  String? sociosTemRestriValue;
  FormFieldController<String>? sociosTemRestriValueController;
  // State field(s) for descriRestriSocio widget.
  FocusNode? descriRestriSocioFocusNode;
  TextEditingController? descriRestriSocioTextController;
  String? Function(BuildContext, String?)?
      descriRestriSocioTextControllerValidator;
  // State field(s) for atividadeTempo widget.
  String? atividadeTempoValue;
  FormFieldController<String>? atividadeTempoValueController;
  // State field(s) for iniciouMEI widget.
  String? iniciouMEIValue;
  FormFieldController<String>? iniciouMEIValueController;
  // State field(s) for alteracao widget.
  String? alteracaoValue;
  FormFieldController<String>? alteracaoValueController;
  // State field(s) for tempoAlteracao widget.
  FocusNode? tempoAlteracaoFocusNode;
  TextEditingController? tempoAlteracaoTextController;
  String? Function(BuildContext, String?)?
      tempoAlteracaoTextControllerValidator;
  // State field(s) for ramoComercial widget.
  FocusNode? ramoComercialFocusNode;
  TextEditingController? ramoComercialTextController;
  String? Function(BuildContext, String?)? ramoComercialTextControllerValidator;
  // State field(s) for banco widget.
  String? bancoValue;
  FormFieldController<String>? bancoValueController;
  // State field(s) for end_Empresa widget.
  FocusNode? endEmpresaFocusNode;
  TextEditingController? endEmpresaTextController;
  String? Function(BuildContext, String?)? endEmpresaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    razaoSocialFocusNode?.dispose();
    razaoSocialTextController?.dispose();

    cnpjFocusNode?.dispose();
    cnpjTextController?.dispose();

    faturamentoFocusNode?.dispose();
    faturamentoTextController?.dispose();

    cPFdossociosFocusNode?.dispose();
    cPFdossociosTextController?.dispose();

    cPFconjugeSociosFocusNode?.dispose();
    cPFconjugeSociosTextController?.dispose();

    descriRestriSocioFocusNode?.dispose();
    descriRestriSocioTextController?.dispose();

    tempoAlteracaoFocusNode?.dispose();
    tempoAlteracaoTextController?.dispose();

    ramoComercialFocusNode?.dispose();
    ramoComercialTextController?.dispose();

    endEmpresaFocusNode?.dispose();
    endEmpresaTextController?.dispose();
  }
}
