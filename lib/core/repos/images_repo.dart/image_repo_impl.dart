import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo.dart/images_repo.dart';

class ImageRepoImpl implements ImagesRepo {
  @override
  Future<Either<Failure, String>> uploadImage(File imageFile) {
    throw UnimplementedError();
  }
}
