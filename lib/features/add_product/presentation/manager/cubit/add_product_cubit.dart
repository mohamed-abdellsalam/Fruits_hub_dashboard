import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo.dart/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productRepo)
      : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(
    AddProductInputEntity addproductInputEntity,
  ) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(addproductInputEntity.image);
    result.fold(
      (failure) {
        emit(AddProductFailure(failure.message));
      },
      (url) async {
        addproductInputEntity.imageUrl = url;
        var result = await productRepo.addProduct(addproductInputEntity);
        result.fold(
          (failure) {
            emit(AddProductFailure(failure.message));
          },
          (success) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
