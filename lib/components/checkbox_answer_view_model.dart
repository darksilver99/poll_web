import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'checkbox_answer_view_widget.dart' show CheckboxAnswerViewWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckboxAnswerViewModel
    extends FlutterFlowModel<CheckboxAnswerViewWidget> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future checkData(
    BuildContext context, {
    String? answer,
  }) async {
    if (FFAppState()
        .tmpAnswerList
        .elementAtOrNull(widget!.itemIndex!)!
        .answer
        .contains(answer)) {
      FFAppState().updateTmpAnswerListAtIndex(
        widget!.itemIndex!,
        (e) => e
          ..updateAnswer(
            (e) => e.remove(answer),
          ),
      );
    } else {
      FFAppState().updateTmpAnswerListAtIndex(
        widget!.itemIndex!,
        (e) => e
          ..updateAnswer(
            (e) => e.add(answer!),
          ),
      );
    }
  }
}
