


import 'package:test_app/contract/GetPhotosContract.dart';
import 'package:test_app/contract/GetPostsContract.dart';
import 'package:test_app/contract/LoginContract.dart';
import 'package:test_app/dependencyInjection/Injector.dart';
import 'package:test_app/model/LoginResponseModel.dart';
import 'package:test_app/utils/FetchException.dart';
import 'package:test_app/webservice/Repository.dart';

class GetPostsPresenter{
  late Repository _repository;
  GetPostsContract _view;

  GetPostsPresenter(this._view) {
    _repository = new Injector().repos;
  }

  void getPosts(url) {
    _repository
        .getPosts(url)
        .then((value) => _view.successPosts(value))
        .catchError((onError) => _view.failurePosts(
        new FetchException(onError.toString())));
  }

}