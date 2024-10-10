import 'package:fruits_hub_dashboard/featuers/add_product/domain/entites/add_prodcut_entity.dart';

abstract class ProductRepo {
  Future<void> addProduct(AddProdcutEntity addProdcutEntity);
}
