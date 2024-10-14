import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failuer.dart';
import 'package:fruits_hub_dashboard/featuers/add_product/domain/entites/product_enitity.dart';

abstract class ProductRepo {
  Future<Either<Failuer, void>> addProduct(ProductEntity addProdcutEntity);
}
