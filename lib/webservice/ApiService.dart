import 'package:http/http.dart' as http;
import 'package:test_app/model/LoginResponseModel.dart';
import 'package:test_app/model/PhotosResponseModel.dart';
import 'package:test_app/model/PostResponseModel.dart';
import 'package:test_app/model/SinglePostDetailResponseModel.dart';

import 'Repository.dart';

class ApiService extends Repository {
  static String loginBaseUrl = 'https://reqres.in/api/';

  static String baseUrl = 'https://jsonplaceholder.typicode.com/';

  @override
  Future<List<PhotosResponseModel>> getPhotos(url) {
    var newUrl = Uri.parse(baseUrl + url);
    print(newUrl);
    return http.get(newUrl).then((http.Response response) {
      if (response.statusCode < 200 ||
          response.statusCode > 300 ||
          response.body == null) {
        throw Exception('exceptionMessage');
      }
      print(response.body.toString());
      return photosResponseModelFromJson(response.body.toString());
    });
  }

  @override
  Future<List<PostsResponseModel>> getPosts(url) {
    var newUrl = Uri.parse(baseUrl + url);
    print(newUrl);
    return http.get(newUrl).then((http.Response response) {
      if (response.statusCode < 200 ||
          response.statusCode > 300 ||
          response.body == null) {
        throw Exception('exceptionMessage');
      }
      print(response.body.toString());
      return postsResponseModelFromJson(response.body.toString());
    });
  }

  @override
  Future<LoginResponseModel> login(LoginRequestModel, url) async {
    var jsonString;
    var response = await http.post(Uri.parse(loginBaseUrl + url),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: loginRequestModelToJson(LoginRequestModel));
    try {
      jsonString = response.body;
      print("saveUserData  Respons" + jsonString);
    } catch (e) {
      print(e.toString());
    }

    return loginResponseModelFromJson(jsonString);
  }

  @override
  Future<SinglePostDetailResponseModel> getPostsDetails(url) async{
    var newUrl = Uri.parse(baseUrl + url);
    print(newUrl);
    return http.get(newUrl).then((http.Response response) {
      if (response.statusCode < 200 ||
          response.statusCode > 300 ||
          response.body == null) {
        throw Exception('exceptionMessage');
      }
      print(response.body.toString());
      return singlePostDetailResponseModelFromJson(response.body.toString());
    });
  }
}
