import 'package:get/get.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/unsplash_data_source.dart';

class TendingTabController extends GetxController {
  //* Active Trips
  //* History Trips
  RxBool homeScreenLoading = false.obs;
  RxInt pageNumber = RxInt(1);
  RxList<UnsplashResponse> tendingImages = RxList<UnsplashResponse>([]);

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
      "order_by": "popular",
      "per_page": "15",
      "page": pageNumber.value.toString()
    };
    Future<Result> result = _apiResponse.getHomeScreenImage(parameter);
    result.then((value) {
      homeScreenLoading.value = false;
      if (value is SuccessState) {
        var res = value.value as List<UnsplashResponse>;
        tendingImages.addAll(res);
        pageNumber.value = pageNumber.value + 1;
      } else {}
    });
  }
}
