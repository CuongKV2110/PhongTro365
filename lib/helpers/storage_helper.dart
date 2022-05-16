import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class StorageHelper {
  Future<dynamic> uploadImage(
      String topicId, String imgFilePath, BuildContext context) async {
    int time = DateTime.now().millisecondsSinceEpoch;
    String ref = 'posts/$topicId/icon_$time.png';
    var result = await uploadFile(ref, imgFilePath, context);
    if (result is bool) {
      return {'url': ref};
    } else {
      return result;
    }
  }

  static Future<dynamic> uploadFile(
      String ref, String filePath, BuildContext context) async {
    File file = File(filePath);

    try {
      await FirebaseStorage.instance.ref(ref).putFile(file);
      return true;
    } on FirebaseException catch (e) {
      return S.of(context).app_info;
    }
  }

  static Future<dynamic> checkFileExist(
      String fileRef, BuildContext context) async {
    try {
      var downloadURL =
          await FirebaseStorage.instance.ref(fileRef).getDownloadURL();
      if (downloadURL.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on FirebaseException catch (e) {
      return false;
    }
  }

  static Future<bool> deleteFile(String url) async {
    try {
      await FirebaseStorage.instance.refFromURL(url).delete();
      return true;
    } on FirebaseException catch (e) {
      return false;
    }
  }
}
