import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'text_field_answer_view_widget.dart' show TextFieldAnswerViewWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TextFieldAnswerViewModel
    extends FlutterFlowModel<TextFieldAnswerViewWidget> {
  ///  Local state fields for this component.

  List<String> tmp = [];
  void addToTmp(String item) => tmp.add(item);
  void removeFromTmp(String item) => tmp.remove(item);
  void removeAtIndexFromTmp(int index) => tmp.removeAt(index);
  void insertAtIndexInTmp(int index, String item) => tmp.insert(index, item);
  void updateTmpAtIndex(int index, Function(String) updateFn) =>
      tmp[index] = updateFn(tmp[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
