
import 'package:test_app/model/LoginResponseModel.dart';
import 'package:test_app/model/PostResponseModel.dart';
import 'package:test_app/model/SinglePostDetailResponseModel.dart';
import 'package:test_app/utils/FetchException.dart';

abstract class PostDetailContract{
  void successPostsDetail(SinglePostDetailResponseModel postsResponseModel);
  void failurePostsDetail(FetchException exception);
}