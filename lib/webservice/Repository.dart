import 'package:test_app/model/LoginResponseModel.dart';
import 'package:test_app/model/PhotosResponseModel.dart';
import 'package:test_app/model/PostResponseModel.dart';
import 'package:test_app/model/SinglePostDetailResponseModel.dart';

abstract class Repository {
  Future<LoginResponseModel> login(LoginRequestModel, url);

  Future<List<PostsResponseModel>> getPosts(url);

  Future<List<PhotosResponseModel>> getPhotos(url);

  Future<SinglePostDetailResponseModel> getPostsDetails(url);
}
