import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo.dart/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
      : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductRepo productsRepo;

  Future<void> addProduct(ProductEntity addProductInputEntity) async {
    emit(AddProductLoading());

    final imageResult =
        await imagesRepo.uploadImage(addProductInputEntity.image);

    imageResult.fold(
      (failure) => emit(AddProductFailure(failure.message)),
      (imageUrl) async {
        addProductInputEntity.imageUrl = imageUrl;

        final productResult =
            await productsRepo.addProduct(addProductInputEntity);

        productResult.fold(
          (failure) => emit(AddProductFailure(failure.message)),
          (_) => emit(AddProductSuccess()),
        );
      },
    );
  }

  Future<void> getImageUrl(String path) async {
    final result = await imagesRepo.getImageUrl(path);

    result.fold(
      (failure) => emit(AddProductFailure(failure.message)),
      (url) => emit(AddProductImageUrlSuccess(url)),
    );
  }
}
