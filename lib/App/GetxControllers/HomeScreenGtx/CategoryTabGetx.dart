import 'package:get/get.dart';
import 'package:reqres_app/network/dataModel/topic.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/unsplash_data_source.dart';
import 'package:reqres_app/network/util/helper.dart';

class CategoryTabController extends GetxController {
  RxInt pageNumber = RxInt(1);
  RxBool homeScreenLoading = false.obs;
  RxBool topicListLoading = false.obs;

  RxList<UnsplashResponse> topicImages = RxList<UnsplashResponse>([]);
  RxInt topicsPageNumber = RxInt(1);

  Rx<RxList<Topics>> topicList = RxList<Topics>([]).obs;
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

  void clearTopicImages() {
    topicImages.clear();
    topicsPageNumber.value = 1;
  }

  void getTopicsImages(String id) {
    var parameter = {
      "page": topicsPageNumber.value.toString(),
      "per_page": "10",
    };
    print(parameter);
    topicListLoading.value = true;
    var params = Helper().queryParameters(parameter);
    String url = "https://api.unsplash.com/topics/$id/photos" + params;
    Future<Result> result = _apiResponse.getTopicImages(url, parameter);
    result.then((value) {
      topicListLoading.value = false;
      if (value is SuccessState) {
        var res = value.value as List<UnsplashResponse>;
        topicsPageNumber.value = topicsPageNumber.value + 1;
        topicImages.addAll(res);
      } else {}
    });
  }

  void getImage() {
    var parameter = {
      "order_by": "latest",
      "per_page": "10",
      "page": pageNumber.value.toString()
    };
    Future<Result> result = _apiResponse.getTopics(parameter);
    result.then((value) {
      homeScreenLoading.value = false;
      if (value is SuccessState) {
        topicList.value.addAll(value.value as Iterable<Topics>);
        pageNumber.value = pageNumber.value + 1;
      } else {}
    });
  }
}
