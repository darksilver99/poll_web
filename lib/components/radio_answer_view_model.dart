import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'radio_answer_view_widget.dart' show RadioAnswerViewWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RadioAnswerViewModel extends FlutterFlowModel<RadioAnswerViewWidget> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future checkData(
    BuildContext context, {
    String? answer,
  }) async {
    FFAppState().updateTmpAnswerListAtIndex(
      widget!.itemIndex!,
      (e) => e
        ..answer = (String answer) {
          return [answer];
        }(answer!)
            .toList(),
    );
  }
}
