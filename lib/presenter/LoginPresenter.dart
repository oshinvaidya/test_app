

import 'package:test_app/contract/LoginContract.dart';
import 'package:test_app/dependencyInjection/Injector.dart';
import 'package:test_app/model/LoginResponseModel.dart';
import 'package:test_app/utils/FetchException.dart';
import 'package:test_app/webservice/Repository.dart';

class LoginPresenter{
  late Repository _repository;
  LoginContract _view;

  LoginPresenter(this._view) {
    _repository = new Injector().repos;
  }

  void login(LoginRequestModel,url) {
    _repository
        .login(LoginRequestModel,url)
        .then((value) => _view.successLogin(LoginResponseModel,value))
        .catchError((onError) => _view.failureLogin(
        new FetchException(onError.toString())));
  }
}