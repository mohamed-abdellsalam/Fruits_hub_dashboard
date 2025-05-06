import 'package:fruits_hub_dashboard/core/repos/images_repo.dart/image_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo.dart/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/services/database_services.dart';
import 'package:fruits_hub_dashboard/core/services/fire_storage.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_services.dart';
import 'package:fruits_hub_dashboard/core/services/storage_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StorageServices>(FireStorage());
  getIt.registerSingleton<DatabaseService>(FireStoreServices());
  getIt.registerSingleton<ImagesRepo>(
    ImageRepoImpl(
      storageServices: getIt.get<StorageServices>(),
    ),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductsRepoImpl(
      getIt.get<DatabaseService>(),
    ),
  );
}
