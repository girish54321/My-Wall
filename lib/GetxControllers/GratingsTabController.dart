import 'package:get/get.dart';
import 'package:reqres_app/network/dataModel/topic.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/unsplash_data_source.dart';

class GratingsTabController extends GetxController {
  RxInt pageNumber = RxInt(1);
  RxBool homeScreenLoading = false.obs;
  RxBool topicListLoading = false.obs;

  RxList<UnsplashResponse> topicImages = RxList<UnsplashResponse>([]);
  RxInt topicsPageNumber = RxInt(1);

  RxList<Topics> topicList = RxList<Topics>([]);
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

  void getImage() {
    List<Topics> da = [
      Topics(
          title: "happy birthday!!",
          coverPhoto: TopicsCoverPhoto(
              urls: TopicsCoverPhotoUrls(
                  small:
                      "https://images.unsplash.com/photo-1583875762487-5f8f7c718d14?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxNzg5Mjl8MHwxfHNlYXJjaHwyfHxoYXBweSUyMGJpcnRoZGF5JTIwfGVufDB8fHx8MTcwOTM3MTg0NHww&ixlib=rb-4.0.3&q=80&w=400"))),
      Topics(
          title: "Merry Christmas!",
          coverPhoto: TopicsCoverPhoto(
              urls: TopicsCoverPhotoUrls(
            small:
                "https://images.unsplash.com/photo-1576344333162-f83e5e18902e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8TWVycnklMjBDaHJpc3RtYXMhfGVufDB8fDB8fHww",
          ))),
    ];
    topicList.addAll(da);
    topicList.refresh();

    //   homeScreenLoading.value = true;
    //   var parameter = {
    //     "order_by": "latest",
    //     "per_page": "30",
    //     "page": pageNumber.value.toString()
    //   };
    //   String url = "https://jsonkeeper.com/b/LDQN";
    //   Future<Result> result = _apiResponse.getTopics(null, url);
    //   result.then((value) {
    //     homeScreenLoading.value = false;
    //     if (value is SuccessState) {
    //       pageNumber.value = pageNumber.value + 1;
    //     } else {}
    //   });
  }
}
