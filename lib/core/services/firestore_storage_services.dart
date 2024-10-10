import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storage_services.dart';
import 'package:path/path.dart' as b;

class FirestoreStorageServices implements StorageServices {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadImage({required File file, required String path}) async {
    String fileName = b.basename(file.path);
    final mountainsRef = storageRef.child("$path/$fileName");
    await mountainsRef.putFile(file);
    return mountainsRef.getDownloadURL();
  }
}
