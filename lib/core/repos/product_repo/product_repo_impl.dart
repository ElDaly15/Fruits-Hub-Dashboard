import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failuer.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/services/dataBase_services.dart';
import 'package:fruits_hub_dashboard/core/services/firebase_services.dart';
import 'package:fruits_hub_dashboard/featuers/add_product/domain/entites/product_enitity.dart';
import 'package:fruits_hub_dashboard/featuers/add_product/domain/entites/review_entity.dart';

class ProductRepoImpl implements ProductRepo {
  DatabaseServices databaseServices = FirebaseServices();
  @override
  Future<Either<Failuer, void>> addProduct(
      ProductEntity addProdcutEntity) async {
    try {
      await databaseServices.addData(
        collectionPath: 'products',
        data: {
          'name': addProdcutEntity.name,
          'price': addProdcutEntity.price,
          'code': addProdcutEntity.code,
          'isFeatured': addProdcutEntity.isFeatured,
          'description': addProdcutEntity.description,
          'imageUrl': addProdcutEntity.imageUrl,
          'calories': addProdcutEntity.calories,
          'amountUnit': addProdcutEntity.amountUnit,
          'avgRating': addProdcutEntity.avgRating,
          'reviews': addProdcutEntity.reviews
              .map((ReviewEntity e) => e.toJson())
              .toList(),
          'ratingCount': addProdcutEntity.ratingCount,
          'expiryMonths': addProdcutEntity.expiryMonths,
          'isOrganic': addProdcutEntity.isOrganic,
          'sellCount': addProdcutEntity.sellCount,
        },
      );
      return const Right(null);
    } catch (e) {
      throw Failuer(message: 'Error While Uploading Product');
    }
  }
}
