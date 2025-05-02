import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storage_services.dart';

class FireStorage implements StorageServices {
  final storageRef = FirebaseStorage.instance;
  @override
  Future<String> uploadImage(String imagePath) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
