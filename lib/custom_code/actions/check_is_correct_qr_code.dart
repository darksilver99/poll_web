// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<PollListRecord?> checkIsCorrectQrCode(String? qrCode) async {
  // Add your function code here!
  if (qrCode == null || qrCode == '-1') {
    return null;
  }
  try {
    var rs = await FirebaseFirestore.instance.doc(qrCode).get();
    return PollListRecord.getDocumentFromData(rs.data()!, rs.reference);
  } catch (e) {
    return null;
  }
}
