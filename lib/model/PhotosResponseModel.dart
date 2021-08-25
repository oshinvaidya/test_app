import 'dart:convert';

List<PhotosResponseModel> photosResponseModelFromJson(String str) => List<PhotosResponseModel>.from(json.decode(str).map((x) => PhotosResponseModel.fromJson(x)));

String photosResponseModelToJson(List<PhotosResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotosResponseModel {
  PhotosResponseModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  factory PhotosResponseModel.fromJson(Map<String, dynamic> json) => PhotosResponseModel(
    albumId: json["albumId"] == null ? null : json["albumId"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    url: json["url"] == null ? null : json["url"],
    thumbnailUrl: json["thumbnailUrl"] == null ? null : json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId == null ? null : albumId,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "url": url == null ? null : url,
    "thumbnailUrl": thumbnailUrl == null ? null : thumbnailUrl,
  };
}
