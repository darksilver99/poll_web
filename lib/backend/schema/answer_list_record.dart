import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswerListRecord extends FirestoreRecord {
  AnswerListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "poll_ref" field.
  DocumentReference? _pollRef;
  DocumentReference? get pollRef => _pollRef;
  bool hasPollRef() => _pollRef != null;

  // "answers" field.
  List<AnswerDataStruct>? _answers;
  List<AnswerDataStruct> get answers => _answers ?? const [];
  bool hasAnswers() => _answers != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _pollRef = snapshotData['poll_ref'] as DocumentReference?;
    _answers = getStructList(
      snapshotData['answers'],
      AnswerDataStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('answer_list')
          : FirebaseFirestore.instance.collectionGroup('answer_list');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('answer_list').doc(id);

  static Stream<AnswerListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnswerListRecord.fromSnapshot(s));

  static Future<AnswerListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnswerListRecord.fromSnapshot(s));

  static AnswerListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnswerListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnswerListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnswerListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnswerListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnswerListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnswerListRecordData({
  DateTime? createDate,
  DocumentReference? pollRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'poll_ref': pollRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnswerListRecordDocumentEquality implements Equality<AnswerListRecord> {
  const AnswerListRecordDocumentEquality();

  @override
  bool equals(AnswerListRecord? e1, AnswerListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createDate == e2?.createDate &&
        e1?.pollRef == e2?.pollRef &&
        listEquality.equals(e1?.answers, e2?.answers);
  }

  @override
  int hash(AnswerListRecord? e) =>
      const ListEquality().hash([e?.createDate, e?.pollRef, e?.answers]);

  @override
  bool isValidKey(Object? o) => o is AnswerListRecord;
}
