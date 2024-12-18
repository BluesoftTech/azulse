import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'page_widget.dart' show PageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PageModel extends FlutterFlowModel<PageWidget> {
  ///  Local state fields for this page.

  bool p1 = true;

  bool p2 = false;

  bool p3 = false;

  bool p4 = false;

  bool p5 = false;

  bool p6 = false;

  bool p7 = false;

  bool p8 = false;

  bool p9 = false;

  bool p10 = false;

  double progress = 0.1;

  ///  State fields for stateful widgets in this page.

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // State field(s) for CPF widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  final cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  // State field(s) for cnpj widget.
  FocusNode? cnpjFocusNode;
  TextEditingController? cnpjTextController;
  final cnpjMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? cnpjTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for whatsapp widget.
  FocusNode? whatsappFocusNode;
  TextEditingController? whatsappTextController;
  final whatsappMask = MaskTextInputFormatter(mask: '55 (##) #####-####');
  String? Function(BuildContext, String?)? whatsappTextControllerValidator;
  // State field(s) for porte widget.
  String? porteValue;
  FormFieldController<String>? porteValueController;
  // State field(s) for tempo widget.
  String? tempoValue;
  FormFieldController<String>? tempoValueController;
  // State field(s) for faturamento widget.
  String? faturamentoValue;
  FormFieldController<String>? faturamentoValueController;
  // State field(s) for credito widget.
  String? creditoValue;
  FormFieldController<String>? creditoValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    cnpjFocusNode?.dispose();
    cnpjTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    whatsappFocusNode?.dispose();
    whatsappTextController?.dispose();
  }
}
