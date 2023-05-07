import 'package:get/get.dart';
import 'package:reqres_app/network/dataModel/topic.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/unsplash_data_source.dart';

class CategoryTabController extends GetxController {
  //* Active Trips
  //* History Trips
  RxBool homeScreenLoading = true.obs;
  RxBool topicListLoading = true.obs;
  RxList<Topics> topicList = RxList<Topics>([]);
  RxList<UnsplashResponse> topicImages = RxList<UnsplashResponse>([]);

  final UnSplashRemoteDataSource _apiResponse = UnSplashRemoteDataSource();

  @override
  void onReady() {
    super.onReady();
    getImage();
  }

  void getTopicsImages(String id) {
    String url = "https://api.unsplash.com/topics/$id/photos";
    Future<Result> result = _apiResponse.getTopicImages(url);
    result.then((value) {
      topicListLoading.value = false;
      if (value is SuccessState) {
        var res = value.value as List<UnsplashResponse>;
        topicImages.value = res;
      } else {}
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getImage() {
    var parameter = {"per_page": "30"};
    Future<Result> result = _apiResponse.getTopics(parameter);
    result.then((value) {
      homeScreenLoading.value = false;
      if (value is SuccessState) {
        var res = value.value as List<Topics>;
        topicList.value = res;
      } else {}
    });
  }
}
