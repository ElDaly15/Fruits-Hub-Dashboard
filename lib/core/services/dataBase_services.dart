// ignore_for_file: file_names

abstract class DatabaseServices {
  Future<void> addData(
      {required String collectionPath, required Map<String, dynamic> data});
}
