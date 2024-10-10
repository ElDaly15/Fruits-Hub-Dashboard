import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failuer.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_storage_services.dart';
import 'package:fruits_hub_dashboard/core/services/storage_services.dart';

class ImagesRepoImpl implements ImagesRepo {
  StorageServices storageServices = FirestoreStorageServices();
  @override
  Future<Either<Failuer, String>> uploadImage({required File? file}) async {
    try {
      var url = await storageServices.uploadImage(file: file!, path: 'images');
      return right(url);
    } catch (e) {
      return left(Failuer(message: 'There is An Error Try Again'));
    }
  }
}
