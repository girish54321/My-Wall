import 'package:get/get.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/unsplash_data_source.dart';

class HomeTabController extends GetxController {
  RxBool homeScreenLoading = true.obs;
  RxList<UnsplashResponse> homeScreenImage = RxList<UnsplashResponse>([]);

  final UnSplashRemoteDataSource _apiResponse = UnSplashRemoteDataSource();

  @override
  void onReady() {
    super.onReady();
    getImage();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getImage() {
    var parameter = {"order_by": "latest", "per_page": "15"};
    Future<Result> result = _apiResponse.getHomeScreenImage(parameter);
    result.then((value) {
      homeScreenLoading.value = false;
      if (value is SuccessState) {
        var res = value.value as List<UnsplashResponse>;
        homeScreenImage.value = res;
      } else {}
    });
  }
}
