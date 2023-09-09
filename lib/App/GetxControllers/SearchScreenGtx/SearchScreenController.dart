import 'package:get/get.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/search_data_source.dart';

class SearchScreenController extends GetxController {
  RxInt pageNumber = RxInt(1);
  RxBool homeScreenLoading = false.obs;
  RxList<UnsplashResponse> homeScreenImage = RxList<UnsplashResponse>([]);
  final SearchRemoteDataSource _apiResponse = SearchRemoteDataSource();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void clearState() {
    homeScreenImage.clear();
    pageNumber.value = 1;
  }

  void getImage(String searchQuery) {
    homeScreenLoading.value = true;
    var parameter = {
      "query": searchQuery,
      "per_page": "10",
      "page": pageNumber.value.toString()
    };
    Future<Result> result = _apiResponse.getSearchImage(parameter);
    result.then((value) {
      homeScreenLoading.value = false;
      if (value is SuccessState) {
        var res = value.value as List<UnsplashResponse>;
        homeScreenImage.addAll(res);
        pageNumber.value = pageNumber.value + 1;
      } else {}
    });
  }
}
