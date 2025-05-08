import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storage_services.dart';
import 'package:fruits_hub_dashboard/core/utils/constans.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SubabaseStorageServices implements StorageServices {
  static late Supabase _supabase;

  static Future<void> createBuckets(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();
    bool isExist = buckets.any((bucket) => bucket.name == bucketName);

    if (!isExist) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static Future<void> initSubabaseStorage() async {
    _supabase = await Supabase.initialize(
      url: kSubaBaseUrl,
      anonKey: kSupaBaseKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var result = await _supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName.$extensionName', file);

    final String publicUrl = _supabase.client.storage
        .from('fruits_images')
        .getPublicUrl('$path/$fileName');

    return result;
  }
}
