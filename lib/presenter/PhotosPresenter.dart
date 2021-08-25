


import 'package:test_app/contract/GetPhotosContract.dart';
import 'package:test_app/contract/LoginContract.dart';
import 'package:test_app/dependencyInjection/Injector.dart';
import 'package:test_app/model/LoginResponseModel.dart';
import 'package:test_app/utils/FetchException.dart';
import 'package:test_app/webservice/Repository.dart';

class GetPhotosPresenter{
  late Repository _repository;
  GetPhotosContract _view;

  GetPhotosPresenter(this._view) {
    _repository = new Injector().repos;
  }

  void getPhotos(url) {
    _repository
        .getPhotos(url)
        .then((value) => _view.successPhotos(value))
        .catchError((onError) => _view.failurePhotos(
        new FetchException(onError.toString())));
  }

}