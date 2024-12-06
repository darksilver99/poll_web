import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/checkbox_answer_view_widget.dart';
import '/components/radio_answer_view_widget.dart';
import '/components/text_field_answer_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  PollListRecord? pollDocument;

  bool isLoading = true;

  int? tmpAnswerIndex = 0;

  List<bool> passList = [];
  void addToPassList(bool item) => passList.add(item);
  void removeFromPassList(bool item) => passList.remove(item);
  void removeAtIndexFromPassList(int index) => passList.removeAt(index);
  void insertAtIndexInPassList(int index, bool item) =>
      passList.insert(index, item);
  void updatePassListAtIndex(int index, Function(bool) updateFn) =>
      passList[index] = updateFn(passList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkIsCorrectQrCode] action in HomePage widget.
  PollListRecord? pollResult;
  // Models for TextFieldAnswerView dynamic component.
  late FlutterFlowDynamicModels<TextFieldAnswerViewModel>
      textFieldAnswerViewModels;

  @override
  void initState(BuildContext context) {
    textFieldAnswerViewModels =
        FlutterFlowDynamicModels(() => TextFieldAnswerViewModel());
  }

  @override
  void dispose() {
    textFieldAnswerViewModels.dispose();
  }
}
