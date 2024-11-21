import 'package:ci_task/features/Home_page/Model/photos_api_response.dart';
import 'package:ci_task/networking/api_endpoint.dart';
import 'package:ci_task/networking/api_service.dart';

class HomeRepository {
  final ApiService _apiService = ApiService();

  Future<PhotosApiResponse> getPhotosData({int? page, int? perPage}) async {
    return await _apiService.getData(
        endpoint: ApiEndpoint.jsonplaceholder(endpoint: JsonplaceholderEndPoint.Photos, page: page, perPage: perPage),
        converter: (response) {
          return PhotosApiResponse.fromJson(response);
        });
  }

  Future<PhotosApiResponse> searchData({String? search}) async {
    return await _apiService.getData(
        endpoint: ApiEndpoint.jsonplaceholder(endpoint: JsonplaceholderEndPoint.Search, query: search ?? ''),
        converter: (response) {
          return PhotosApiResponse.fromJson(response);
        });
  }
}
