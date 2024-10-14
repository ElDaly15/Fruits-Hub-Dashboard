import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/core/errors/failuer.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'product_code_check_state.dart';

class ProductCodeCheckCubit extends Cubit<ProductCodeCheckState> {
  ProductCodeCheckCubit() : super(ProductCodeCheckInitial());

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<bool> checkCode({required String code}) async {
    try {
      QuerySnapshot querySnapshot = await firebaseFirestore
          .collection('products')
          .where('code', isEqualTo: code)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Failuer(message: e.toString());
    }
  }
}
