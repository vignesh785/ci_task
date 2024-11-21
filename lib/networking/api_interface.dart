abstract class ApiInterface {
  const ApiInterface();

  Future<T> getData<T>(
      {required String endpoint,
      Map<String, dynamic>? queryParams,
      required T Function(dynamic responseBody) converter,
      final dynamic Function(bool)? onError});

  Future<T> setData<T>(
      {required String endpoint,
      required Map<String, dynamic> data,
      required T Function(Map<String, dynamic> response) converter,
      final dynamic Function(bool)? onError});

  Future<T> updateData<T>(
      {required String endpoint,
      required Map<String, dynamic> data,
      required T Function(Map<String, dynamic> response) converter,
      final dynamic Function(bool)? onError});

  Future<T> patchData<T>(
      {required String endpoint,
      required Map<String, dynamic> data,
      required T Function(Map<String, dynamic> response) converter,
      final dynamic Function(bool)? onError});

  Future<T> deleteData<T>(
      {required String endpoint,
      Map<String, dynamic>? data,
      required T Function(Map<String, dynamic> response) converter,
      final dynamic Function(bool)? onError});
}
