import 'dart:io';

abstract class StorageServices {
  Future<String> uploadFile(File file, String path);
  Future<String> getFileUrl(String path);
}
