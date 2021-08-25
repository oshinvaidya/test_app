
import 'package:test_app/webservice/ApiService.dart';
import 'package:test_app/webservice/Repository.dart';

class Injector{
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  Repository get repos{
    return new ApiService();
  }

}