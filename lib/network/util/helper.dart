import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:reqres_app/App/auth/login/loginScreen.dart';
import 'package:reqres_app/network/model/loading.dart';
import 'package:reqres_app/widget/DialogHelper.dart';

class Helper {
  goToPage({required BuildContext context, required Widget child}) {
    if (Platform.isAndroid) {
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
}
