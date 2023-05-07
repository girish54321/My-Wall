import 'package:get/get.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/unsplash_data_source.dart';

class HomeTabController extends GetxController {
  RxInt pageNumber = RxInt(1);
  RxBool homeScreenLoading = false.obs;
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
    if (homeScreenLoading.value == true) {
      return;
    }
    homeScreenLoading.value = true;
    var parameter = {
      "order_by": "latest",
      "per_page": "10",
      "page": pageNumber.value.toString()
    };
    Future<Result> result = _apiResponse.getHomeScreenImage(parameter);
    result.then((value) {
      homeScreenLoading.value = false;
      if (value is SuccessState) {
        var res = value.value as List<UnsplashResponse>;
        homeScreenImage.value.addAll(res);
        pageNumber.value = pageNumber.value + 1;
      } else {}
    });
  }
}
