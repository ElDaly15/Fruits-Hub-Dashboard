import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/featuers/add_product/domain/entites/product_enitity.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productRepo)
      : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductRepo productRepo;

  Future<void> addProduct({required ProductEntity addProductEntity}) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(file: addProductEntity.imageFile);

    result.fold((failuer) {
      emit(AddProductFailuer(errorMsg: failuer.message));
    }, (url) async {
      addProductEntity.imageUrl = url;

      var result = await productRepo.addProduct(addProductEntity);

      result.fold((failuer) {
        emit(AddProductFailuer(errorMsg: failuer.message));
      }, (value) {
        emit(AddProductSuccess());
      });
    });
  }
}
