import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failuer.dart';

abstract class ImagesRepo {
  Future<Either<Failuer, String>> uploadImage({required File? file});
}
