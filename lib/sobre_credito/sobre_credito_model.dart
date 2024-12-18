import '/flutter_flow/flutter_flow_util.dart';
import 'sobre_credito_widget.dart' show SobreCreditoWidget;
import 'package:flutter/material.dart';

class SobreCreditoModel extends FlutterFlowModel<SobreCreditoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for valorCredito widget.
  FocusNode? valorCreditoFocusNode;
  TextEditingController? valorCreditoTextController;
  String? Function(BuildContext, String?)? valorCreditoTextControllerValidator;
  // State field(s) for finalidadeCred widget.
  FocusNode? finalidadeCredFocusNode;
  TextEditingController? finalidadeCredTextController;
  String? Function(BuildContext, String?)?
      finalidadeCredTextControllerValidator;
  // State field(s) for cidade widget.
  FocusNode? cidadeFocusNode;
  TextEditingController? cidadeTextController;
  String? Function(BuildContext, String?)? cidadeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    valorCreditoFocusNode?.dispose();
    valorCreditoTextController?.dispose();

    finalidadeCredFocusNode?.dispose();
    finalidadeCredTextController?.dispose();

    cidadeFocusNode?.dispose();
    cidadeTextController?.dispose();
  }
}
