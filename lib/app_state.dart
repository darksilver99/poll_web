import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<AnswerDataStruct> _tmpAnswerList = [];
  List<AnswerDataStruct> get tmpAnswerList => _tmpAnswerList;
  set tmpAnswerList(List<AnswerDataStruct> value) {
    _tmpAnswerList = value;
  }

  void addToTmpAnswerList(AnswerDataStruct value) {
    tmpAnswerList.add(value);
  }

  void removeFromTmpAnswerList(AnswerDataStruct value) {
    tmpAnswerList.remove(value);
  }

  void removeAtIndexFromTmpAnswerList(int index) {
    tmpAnswerList.removeAt(index);
  }

  void updateTmpAnswerListAtIndex(
    int index,
    AnswerDataStruct Function(AnswerDataStruct) updateFn,
  ) {
    tmpAnswerList[index] = updateFn(_tmpAnswerList[index]);
  }

  void insertAtIndexInTmpAnswerList(int index, AnswerDataStruct value) {
    tmpAnswerList.insert(index, value);
  }
}
