// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionDataStruct extends FFFirebaseStruct {
  QuestionDataStruct({
    String? topic,
    int? type,
    List<String>? optionList,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _topic = topic,
        _type = type,
        _optionList = optionList,
        super(firestoreUtilData);

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  set topic(String? val) => _topic = val;

  bool hasTopic() => _topic != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  set type(int? val) => _type = val;

  void incrementType(int amount) => type = type + amount;

  bool hasType() => _type != null;

  // "option_list" field.
  List<String>? _optionList;
  List<String> get optionList => _optionList ?? const [];
  set optionList(List<String>? val) => _optionList = val;

  void updateOptionList(Function(List<String>) updateFn) {
    updateFn(_optionList ??= []);
  }

  bool hasOptionList() => _optionList != null;

  static QuestionDataStruct fromMap(Map<String, dynamic> data) =>
      QuestionDataStruct(
        topic: data['topic'] as String?,
        type: castToType<int>(data['type']),
        optionList: getDataList(data['option_list']),
      );

  static QuestionDataStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'topic': _topic,
        'type': _type,
        'option_list': _optionList,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'topic': serializeParam(
          _topic,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.int,
        ),
        'option_list': serializeParam(
          _optionList,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static QuestionDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionDataStruct(
        topic: deserializeParam(
          data['topic'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.int,
          false,
        ),
        optionList: deserializeParam<String>(
          data['option_list'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'QuestionDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionDataStruct &&
        topic == other.topic &&
        type == other.type &&
        listEquality.equals(optionList, other.optionList);
  }

  @override
  int get hashCode => const ListEquality().hash([topic, type, optionList]);
}

QuestionDataStruct createQuestionDataStruct({
  String? topic,
  int? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuestionDataStruct(
      topic: topic,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuestionDataStruct? updateQuestionDataStruct(
  QuestionDataStruct? questionData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    questionData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestionDataStructData(
  Map<String, dynamic> firestoreData,
  QuestionDataStruct? questionData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (questionData == null) {
    return;
  }
  if (questionData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && questionData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final questionDataData =
      getQuestionDataFirestoreData(questionData, forFieldValue);
  final nestedData =
      questionDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = questionData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestionDataFirestoreData(
  QuestionDataStruct? questionData, [
  bool forFieldValue = false,
]) {
  if (questionData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(questionData.toMap());

  // Add any Firestore field values
  questionData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestionDataListFirestoreData(
  List<QuestionDataStruct>? questionDatas,
) =>
    questionDatas?.map((e) => getQuestionDataFirestoreData(e, true)).toList() ??
    [];
