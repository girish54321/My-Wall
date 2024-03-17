import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/App/HomeScreen/HomeTabScreen.dart';
import 'package:reqres_app/AppConst/AppConst.dart';
import 'package:reqres_app/AppConst/AppEnv.dart';
import 'package:reqres_app/network/dataModel/LoginSuccess.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/remote_data_source.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  PullToRefreshController? pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  void loginUser(String? code) {
    if (code == null) {
      return;
    }
    Helper().dismissKeyBoard(context);
    Helper().showLoading();
    RemoteDataSource _apiResponse = RemoteDataSource();
    var parameter = {
      "client_id": client_id,
      "client_secret": client_secret,
      "redirect_uri": redirect_uri,
      "code": code,
      "grant_type": grant_type
    };
    Future<Result> result = _apiResponse.userLogin(parameter);
    result.then((value) {
      if (value is SuccessState) {
        Helper().hideLoading();
        GetStorage box = GetStorage();
        var res = value.value as LoginSuccess;
        box.write(JWT_KEY, res.accessToken);
        Get.off(HomeTabScreen());
      } else if (value is ErrorState) {
        var error = value.msg;
        print(error);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login MacOS!")),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: [
                  Platform.isMacOS
                      ? Column(
                          children: [
                            TextField(
                              onSubmitted: ((value) {
                                if (value.toString().contains('code')) {
                                  String url1 = value.toString();
                                  String? code = Helper().getCodeFromUrl(url1);
                                  loginUser(code);
                                }
                              }),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blueAccent,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                            const SizedBox(
                              height: 27,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  if (!await launchUrl(Uri.parse(loginURL))) {}
                                },
                                child: Text("Login")),
                          ],
                        )
                      : InAppWebView(
                          key: webViewKey,
                          initialUrlRequest:
                              URLRequest(url: Uri.parse(loginURL)),
                          shouldOverrideUrlLoading:
                              (controller, navigationAction) async {
                            return NavigationActionPolicy.ALLOW;
                          },
                          onLoadStop: (controller, url) async {
                            pullToRefreshController?.endRefreshing();
                            if (url.toString().contains('code')) {
                              String url1 = url.toString();
                              String? code = Helper().getCodeFromUrl(url1);
                              loginUser(code);
                            }
                            setState(() {
                              this.url = url.toString();
                              urlController.text = this.url;
                            });
                          },
                          onProgressChanged: (controller, progress) {
                            if (progress == 100) {
                              Helper().hideLoading();
                              pullToRefreshController?.endRefreshing();
                            }
                            setState(() {
                              this.progress = progress / 100;
                              urlController.text = url;
                            });
                          },
                          onUpdateVisitedHistory:
                              (controller, url, androidIsReload) {
                            setState(() {
                              this.url = url.toString();
                              urlController.text = this.url;
                            });
                          },
                          onConsoleMessage: (controller, consoleMessage) {
                            print(consoleMessage);
                          },
                        ),
                  progress < 1.0
                      ? LinearProgressIndicator(value: progress)
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
