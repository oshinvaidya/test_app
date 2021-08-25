import 'package:test_app/model/LoginResponseModel.dart';
import 'package:test_app/utils/FetchException.dart';

abstract class LoginContract{
  void successLogin(LoginResponseModel,url);
  void failureLogin(FetchException exception);
}