// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:fruits_hub_dashboard/core/services/storage_services.dart';
// import 'package:path/path.dart' as b;

// class FireStorage implements StorageServices {
//   final storageRef = FirebaseStorage.instance.ref();
//   @override
//   Future<String> uploadFile(File file, String path) async {
//     String fileName = b.basename(path);
//     String extensionName = b.extension(file.path);
//     var fileRef = storageRef.child('$path/$fileName.$extensionName');
//     await fileRef.putFile(file);
//     var fileUrl = await fileRef.getDownloadURL();
//     return fileUrl;
//   }
// }
