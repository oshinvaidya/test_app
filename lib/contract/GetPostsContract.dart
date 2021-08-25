import 'package:test_app/model/LoginResponseModel.dart';
import 'package:test_app/model/PostResponseModel.dart';
import 'package:test_app/utils/FetchException.dart';

abstract class GetPostsContract{
  void successPosts(List<PostsResponseModel> postsResponseModel);
  void failurePosts(FetchException exception);
}