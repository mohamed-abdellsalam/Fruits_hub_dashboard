import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storage_services.dart';
import 'package:fruits_hub_dashboard/core/utils/constans.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStoargeService implements StorageServices {
  static late Supabase _supabase;

  static createBuckets(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();

    bool isBucketExists = false;

    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExists = true;
        break;
      }
    }
    if (!isBucketExists) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSubaBaseUrl,
      anonKey: kSupaBaseKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    final String fileName = b.basename(file.path);

    await _supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName', file);

    final String publicUrl = _supabase.client.storage
        .from('fruits_images')
        .getPublicUrl('$path/$fileName');

    return publicUrl;
  }

  @override
  Future<String> getFileUrl(String path) async {
    final String publicUrl =
        _supabase.client.storage.from('fruits_images').getPublicUrl(path);

    return publicUrl;
  }
}
