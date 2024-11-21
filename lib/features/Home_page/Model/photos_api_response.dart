class PhotosApiResponse {
  final List<PhotosData>? data;
  PhotosApiResponse({this.data});
  PhotosApiResponse.fromJson(List<dynamic> json) : data = (json as List<dynamic>?)?.map((item) => PhotosData.fromJson(item as Map<String, dynamic>)).toList();
}

class PhotosData {
  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  PhotosData({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  PhotosData.fromJson(Map<String, dynamic> json)
      : albumId = json['albumId'] as int?,
        id = json['id'] as int?,
        title = json['title'] as String?,
        url = json['url'] as String?,
        thumbnailUrl = json['thumbnailUrl'] as String?;
}
