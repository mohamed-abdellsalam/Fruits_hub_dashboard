import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo.dart/images_repo.dart';
import 'package:fruits_hub_dashboard/core/services/storage_services.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_enpoint.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageServices stoarageService;

  ImagesRepoImpl(this.stoarageService);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url =
          await stoarageService.uploadFile(image, BackendEnpoint.images);
      return Right(url);
    } catch (e) {
      return const Left(
        ServerFailure(message: 'Failed to upload image'),
      );
    }
  }

  Future<Either<Failure, String>> getImageUrl(String path) async {
    try {
      String url = await stoarageService.getFileUrl(path);
      return Right(url);
    } catch (e) {
      return const Left(
        ServerFailure(message: 'Failed to get image URL'),
      );
    }
  }
}
