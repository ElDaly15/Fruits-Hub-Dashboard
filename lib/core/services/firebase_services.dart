import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/core/services/dataBase_services.dart';

class FirebaseServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String collectionPath,
      required Map<String, dynamic> data}) async {
    firestore.collection(collectionPath).add(data);
  }
}
