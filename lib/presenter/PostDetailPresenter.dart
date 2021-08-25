






import 'package:test_app/contract/GetPhotosContract.dart';
import 'package:test_app/contract/GetPostsContract.dart';
import 'package:test_app/contract/LoginContract.dart';
import 'package:test_app/contract/PostDetailContract.dart';
import 'package:test_app/dependencyInjection/Injector.dart';
import 'package:test_app/model/LoginResponseModel.dart';
import 'package:test_app/utils/FetchException.dart';
import 'package:test_app/webservice/Repository.dart';

class PostDetailPresenter{
  late Repository _repository;
  PostDetailContract _view;

  PostDetailPresenter(this._view) {
    _repository = new Injector().repos;
  }

  void getPostDetail(url) {
    _repository
        .getPostsDetails(url)
        .then((value) => _view.successPostsDetail(value))
        .catchError((onError) => _view.failurePostsDetail(
        new FetchException(onError.toString())));
  }

}