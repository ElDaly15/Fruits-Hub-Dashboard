import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failuer.dart';
import 'package:fruits_hub_dashboard/featuers/add_product/domain/entites/add_prodcut_entity.dart';

abstract class ProductRepo {
  Future<Either<Failuer, void>> addProduct(AddProdcutEntity addProdcutEntity);
}
