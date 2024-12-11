// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswerDataStruct extends FFFirebaseStruct {
  AnswerDataStruct({
    List<String>? answer,
    int? questionType,
    String? topicId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _answer = answer,
        _questionType = questionType,
        _topicId = topicId,
        super(firestoreUtilData);

  // "answer" field.
  List<String>? _answer;
  List<String> get answer => _answer ?? const [];
  set answer(List<String>? val) => _answer = val;

  void updateAnswer(Function(List<String>) updateFn) {
    updateFn(_answer ??= []);
  }

  bool hasAnswer() => _answer != null;

  // "question_type" field.
  int? _questionType;
  int get questionType => _questionType ?? 0;
  set questionType(int? val) => _questionType = val;

  void incrementQuestionType(int amount) =>
      questionType = questionType + amount;

  bool hasQuestionType() => _questionType != null;

  // "topic_id" field.
  String? _topicId;
  String get topicId => _topicId ?? '';
  set topicId(String? val) => _topicId = val;

  bool hasTopicId() => _topicId != null;

  static AnswerDataStruct fromMap(Map<String, dynamic> data) =>
      AnswerDataStruct(
        answer: getDataList(data['answer']),
        questionType: castToType<int>(data['question_type']),
        topicId: data['topic_id'] as String?,
      );

  static AnswerDataStruct? maybeFromMap(dynamic data) => data is Map
      ? AnswerDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'answer': _answer,
        'question_type': _questionType,
        'topic_id': _topicId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'answer': serializeParam(
          _answer,
          ParamType.String,
          isList: true,
        ),
        'question_type': serializeParam(
          _questionType,
          ParamType.int,
        ),
        'topic_id': serializeParam(
          _topicId,
          ParamType.String,
        ),
      }.withoutNulls;

  static AnswerDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnswerDataStruct(
        answer: deserializeParam<String>(
          data['answer'],
          ParamType.String,
          true,
        ),
        questionType: deserializeParam(
          data['question_type'],
          ParamType.int,
          false,
        ),
        topicId: deserializeParam(
          data['topic_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AnswerDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AnswerDataStruct &&
        listEquality.equals(answer, other.answer) &&
        questionType == other.questionType &&
        topicId == other.topicId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([answer, questionType, topicId]);
}

AnswerDataStruct createAnswerDataStruct({
  int? questionType,
  String? topicId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AnswerDataStruct(
      questionType: questionType,
      topicId: topicId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AnswerDataStruct? updateAnswerDataStruct(
  AnswerDataStruct? answerData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    answerData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAnswerDataStructData(
  Map<String, dynamic> firestoreData,
  AnswerDataStruct? answerData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (answerData == null) {
    return;
  }
  if (answerData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && answerData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final answerDataData = getAnswerDataFirestoreData(answerData, forFieldValue);
  final nestedData = answerDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = answerData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAnswerDataFirestoreData(
  AnswerDataStruct? answerData, [
  bool forFieldValue = false,
]) {
  if (answerData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(answerData.toMap());

  // Add any Firestore field values
  answerData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAnswerDataListFirestoreData(
  List<AnswerDataStruct>? answerDatas,
) =>
    answerDatas?.map((e) => getAnswerDataFirestoreData(e, true)).toList() ?? [];
