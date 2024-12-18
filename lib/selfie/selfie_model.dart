import '/flutter_flow/flutter_flow_util.dart';
import 'selfie_widget.dart' show SelfieWidget;
import 'package:flutter/material.dart';

class SelfieModel extends FlutterFlowModel<SelfieWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
