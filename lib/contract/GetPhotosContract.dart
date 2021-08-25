import 'package:test_app/model/PhotosResponseModel.dart';
import 'package:test_app/utils/FetchException.dart';

abstract class GetPhotosContract{
  void successPhotos(List<PhotosResponseModel> photosResponseModel );
  void failurePhotos(FetchException exception);
}