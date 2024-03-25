import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/App/HomeScreen/HomeTabScreen.dart';
import 'package:reqres_app/AppConst/AppConst.dart';
import 'package:reqres_app/AppConst/AppEnv.dart';
import 'package:reqres_app/network/dataModel/LoginSuccess.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/remote_data_source.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreenMacOS extends StatefulWidget {
  const LoginScreenMacOS({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenMacOS> {
  final GlobalKey webViewKey = GlobalKey();

  String url = "";
  double progress = 0;

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
          children: [
            TextField(
              onSubmitted: ((value) {
                loginUser(value);
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
            ElevatedButton(
                onPressed: () async {
                  if (!await launchUrl(Uri.parse(loginURL))) {}
                },
                child: Text("Login")),
            progress < 1.0
                ? LinearProgressIndicator(value: progress)
                : Container(),
          ],
        ),
      ),
    );
  }
}
