import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/services/database_services.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_enpoint.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/models/product_model.dart';

class ProductsRepoImpl implements ProductRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, void>> addProduct(
      ProductEntity addProductInputEntity) async {
    try {
      await databaseService.addData(
        path: BackendEnpoint.products,
        data: ProductModel.fromEntity(addProductInputEntity).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return const Left(
        ServerFailure(
          message: 'Failed to add product',
        ),
      );
    }
  }
}
