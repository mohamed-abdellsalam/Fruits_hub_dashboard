abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentid,
  });
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId});

  Future<bool> ifDataExists({
    required String path,
    required String documentId,
  });
}
