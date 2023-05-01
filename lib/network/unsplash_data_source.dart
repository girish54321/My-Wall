import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:reqres_app/network/ReqResClient.dart';
import 'package:reqres_app/network/dataModel/LoginSuccess.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/model/userListModal.dart';
import 'package:reqres_app/network/util/auth_api_path.dart';
import 'package:reqres_app/network/util/request_type.dart';
import 'package:reqres_app/network/util/unsplash_path.dart';
import 'package:reqres_app/widget/DialogHelper.dart';

class UnSplashRemoteDataSource {
  ReqResClient client = ReqResClient(Client());

  Future<Result> getHomeScreenImage(apiParameter) async {
    print("object");
    print(apiParameter.toString());
    Result incomingData = Result.loading("Loading");
    try {
      final response = await client.request(
          requestType: RequestType.GET,
          path: UnSplashAPIPathHelper.getValue(UnSplashAPIPath.home),
          params: apiParameter);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        List<UnsplashResponse> unPlashResponseList = [];
        for (var i = 0; i < data.length; i++) {
          UnsplashResponse unPlashResponse = UnsplashResponse.fromJson(data[i]);
          unPlashResponseList.add(unPlashResponse);
        }
        incomingData =
            Result<List<UnsplashResponse>>.success(unPlashResponseList);
        return incomingData;
      } else {
        DialogHelper.showErrorDialog(description: response.body.toString());
        incomingData = Result.error(response.statusCode);
        return incomingData;
      }
    } catch (error) {
      print(error.toString());
      incomingData = Result.error("Something went wrong!");
      DialogHelper.showErrorDialog(description: "Something went wrong!");
      return incomingData;
    }
  }
}
