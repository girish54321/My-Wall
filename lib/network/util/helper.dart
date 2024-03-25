import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:filesize/filesize.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:reqres_app/App/auth/login/loginScreen.dart';
import 'package:reqres_app/GetxControllers/SelectedImageGetx.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/model/downloadOption.dart';
import 'package:reqres_app/network/model/loading.dart';
import 'package:reqres_app/responsive/enums/device_screen_type.dart';
import 'package:reqres_app/responsive/utils/ui_utils.dart';
import 'package:reqres_app/widget/DialogHelper.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  goToPage({required BuildContext context, required Widget child}) {
    if (Platform.isAndroid || Platform.isMacOS) {
      Navigator.push(context,
          PageTransition(type: PageTransitionType.rightToLeft, child: child));
    }
    if (Platform.isIOS) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => child,
        ),
      );
    }
  }

  int responsiveNumGridTiles(MediaQueryData mediaQuery) {
    double deviceWidth = mediaQuery.size.width;
    if (deviceWidth < 700) {
      // return 6;
      return 4;
    } else if (deviceWidth < 1200) {
      return 8;
    } else if (deviceWidth < 1650) {
      return 16;
    } else {
      return 16;
    }
  }

  getMobileOrientation(context) {
    int cellCount = 4;
    var mediaQuery = MediaQuery.of(context);
    DeviceScreenType deviceScreenType = getDeviceType(mediaQuery);
    var orientation = mediaQuery.orientation;
    if (deviceScreenType == DeviceScreenType.Mobile) {
      cellCount = orientation == Orientation.portrait ? 2 : 4;
    } else if (deviceScreenType == DeviceScreenType.Tablet) {
      cellCount = 8;
    } else if (deviceScreenType == DeviceScreenType.Desktop) {
      cellCount = responsiveNumGridTiles(mediaQuery);
    }
    return cellCount;
  }

  Future<void> userLogout(BuildContext context) async {
    final action =
        await Dialogs.yesAbortDialog(context, 'Log Out?', 'Are you sure?');
    if (action == DialogAction.yes) {
      final box = GetStorage();
      box.remove('token');
      Get.offAll(const LoginScreen());
    }
  }

  showMessage(String message, BuildContext context) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.tealAccent,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  dismissKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }

  hideLoading() {
    Get.until((route) => !Get.isDialogOpen!);
  }

  goBack() {
    Get.back();
  }

  String? getCodeFromUrl(String url) {
    Uri uri = Uri.parse(url);
    String? code = uri.queryParameters['code'];
    return code;
  }

  String queryParameters(Map<String, String> params) {
    if (params != null) {
      final jsonString = Uri(queryParameters: params);
      return '?${jsonString.query}';
    }
    return '';
  }

  Widget loadingItem(LoadingElement? loadingElement, int index) {
    return AspectRatio(
      aspectRatio:
          (loadingElement?.width ?? 1200) / (loadingElement?.height ?? 2000),
      child: GlowingProgressIndicator(
        duration: Duration(milliseconds: (index + 5) * 100),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.4),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
        ),
      ),
    );
  }

  String getFileName(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  void selectImage(UnsplashResponse data) {
    final SelectedImageController selectedImageController =
        Get.put(SelectedImageController());
    selectedImageController.selectImage(data);
  }

  Future<void> startDownload(String url, BuildContext context) async {
    if (Platform.isMacOS) {
      if (!await launchUrl(Uri.parse(url))) {}
    } else {
      // final Directory? downloadsDir = await getDownloadsDirectory();
      final Directory? downloadsDir = Platform.isAndroid
          ? await getDownloadsDirectory()
          : await getApplicationDocumentsDirectory(); // for iOS
      await FlutterDownloader.enqueue(
          url: url,
          savedDir: downloadsDir!.path,
          //* Android
          saveInPublicStorage: Platform.isAndroid, //* For android
          // fileName: Helper().getFileName(5), //"png"
          //* iOS
          fileName: Platform.isAndroid
              ? Helper().getFileName(5)
              : "${Helper().getFileName(5)}.png",
          showNotification:
              true, // show download progress in status bar (for Android)
          openFileFromNotification: true);
      const snackBar = SnackBar(
        content: Text('Yay! Image Saved!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    goBack();
  }

  void settingModalBottomSheet(context, List<DownloadOption> list) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(0.0),
          ),
        ),
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Padding(
                    padding: EdgeInsets.only(left: 1, right: 1, top: 14),
                    child: Text(
                      "Download option",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox()
                ],
              ),
              ...list.map(((e) {
                return ListTile(
                    title: Text(e.type),
                    trailing: Text(filesize(e.fileSize)),
                    onTap: () => {startDownload(e.url, context)});
              })),
            ],
          );
        });
  }
}
