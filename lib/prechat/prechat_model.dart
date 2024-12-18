import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'prechat_widget.dart' show PrechatWidget;
import 'package:flutter/material.dart';

class PrechatModel extends FlutterFlowModel<PrechatWidget> {
  ///  Local state fields for this page.

  int? userANON;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ConversasRow? idConversa;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  RespostasFormRow? idResposta;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
