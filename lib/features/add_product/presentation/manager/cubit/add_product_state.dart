part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductLoading extends AddProductState {}

final class AddProductSuccess extends AddProductState {}

final class AddProductFailure extends AddProductState {
  final String errMessage;
  AddProductFailure(this.errMessage);
}

final class AddProductImageUrlSuccess extends AddProductState {
  final String imageUrl;
  AddProductImageUrlSuccess(this.imageUrl);
}
