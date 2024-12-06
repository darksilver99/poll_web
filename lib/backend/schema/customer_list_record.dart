import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerListRecord extends FirestoreRecord {
  CustomerListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customer_list');

  static Stream<CustomerListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerListRecord.fromSnapshot(s));

  static Future<CustomerListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomerListRecord.fromSnapshot(s));

  static CustomerListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomerListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerListRecordData({
  DateTime? createDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomerListRecordDocumentEquality
    implements Equality<CustomerListRecord> {
  const CustomerListRecordDocumentEquality();

  @override
  bool equals(CustomerListRecord? e1, CustomerListRecord? e2) {
    return e1?.createDate == e2?.createDate;
  }

  @override
  int hash(CustomerListRecord? e) => const ListEquality().hash([e?.createDate]);

  @override
  bool isValidKey(Object? o) => o is CustomerListRecord;
}
