import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo.dart/images_repo.dart';
import 'package:fruits_hub_dashboard/core/services/storage_services.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_enpoint.dart';

class ImageRepoImpl implements ImagesRepo {
  final StorageServices storageServices;

  ImageRepoImpl({required this.storageServices});
  @override
  Future<Either<Failure, String>> uploadImage(File imageFile) async {
    try {
      String url =
          await storageServices.uploadFile(imageFile, BackendEnpoint.images);
      return Right(url);
    } on Exception catch (e) {
      return left(
        const ServerFailure(message: 'Failed to upload image'),
      );
    }
  }
}
