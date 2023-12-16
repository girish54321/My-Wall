import 'package:get/get.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/model/downloadOption.dart';
import 'package:http/http.dart' as http;
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/model/selected_image_response.dart';
import 'package:reqres_app/network/unsplash_data_source.dart';
import 'package:reqres_app/network/util/helper.dart';

class SelectedImageController extends GetxController {
  final Rx<UnsplashResponse?> selectedImage = UnsplashResponse().obs;
  final Rx<SelectedImageResponse?> selectedImageData =
      SelectedImageResponse().obs;
  final RxString title = RxString("Download Option");
  final RxList<DownloadOption> downloadOptionList = RxList([]);

  final UnSplashRemoteDataSource _apiResponse = UnSplashRemoteDataSource();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  createUrlList(UnsplashResponse data) async {
    downloadOptionList.clear();
    List urls = [
      {
        "type": "Small",
        "url": data.urls?.small,
      },
      {
        "type": "Regular",
        "url": data.urls?.regular,
      },
      {
        "type": "Full",
        "url": data.urls?.full,
      },
      {"type": "Raw", "url": data.urls?.raw}
    ];

    for (var i = 0; i < urls.length; i++) {
      http.Response r = await http.head(Uri.parse(urls[i]['url']));
      DownloadOption downloadOption = DownloadOption(
          urls[i]['url'], urls[i]['type'], r.headers["content-length"]!);
      downloadOptionList.add(downloadOption);
    }
  }

  void selectImage(UnsplashResponse data) {
    selectedImage.value = data;
    createUrlList(data);
    Helper().showLoading();
    Future<Result> result = _apiResponse.getSelectedImage(data.id ?? "");
    result.then((value) {
      Helper().hideLoading();
      if (value is SuccessState) {
        var res = value.value as SelectedImageResponse;
        selectedImageData.value = res;
      } else {}
    });
  }
}
