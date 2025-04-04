import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:reqres_app/network/ReqResClient.dart';
import 'package:reqres_app/network/dataModel/topic.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/model/selected_image_response.dart';
import 'package:reqres_app/network/util/request_type.dart';
import 'package:reqres_app/network/util/unsplash_path.dart';
import 'package:reqres_app/widget/DialogHelper.dart';

class UnSplashRemoteDataSource {
  ReqResClient client = ReqResClient(Client());

  Future<Result> getHomeScreenImage(apiParameter) async {
    Result incomingData = Result.loading("Loading");
    try {
      final response = await client.request(
        requestType: RequestType.GET,
        path: UnSplashAPIPathHelper.getValue(UnSplashAPIPath.home),
        params: apiParameter,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        List<UnsplashResponse> unPlashResponseList = [];
        for (var i = 0; i < data.length; i++) {
          UnsplashResponse unPlashResponse = UnsplashResponse.fromJson(data[i]);
          unPlashResponseList.add(unPlashResponse);
        }
        incomingData = Result<List<UnsplashResponse>>.success(
          unPlashResponseList,
        );
        return incomingData;
      } else {
        DialogHelper.showErrorDialog(description: response.body.toString());
        incomingData = Result.error(response.statusCode);
        return incomingData;
      }
    } catch (error) {
      incomingData = Result.error("Something went wrong!");
      DialogHelper.showErrorDialog(description: "Something went wrong!");
      return incomingData;
    }
  }

  Future<Result> getTradingImage(apiParameter) async {
    Result incomingData = Result.loading("Loading");
    try {
      final response = await client.request(
        requestType: RequestType.GET,
        path: UnSplashAPIPathHelper.getValue(UnSplashAPIPath.home),
        params: apiParameter,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        List<UnsplashResponse> unPlashResponseList = [];
        for (var i = 0; i < data.length; i++) {
          UnsplashResponse unPlashResponse = UnsplashResponse.fromJson(data[i]);
          unPlashResponseList.add(unPlashResponse);
        }
        incomingData = Result<List<UnsplashResponse>>.success(
          unPlashResponseList,
        );
        return incomingData;
      } else {
        DialogHelper.showErrorDialog(description: response.body.toString());
        incomingData = Result.error(response.statusCode);
        return incomingData;
      }
    } catch (error) {
      incomingData = Result.error("Something went wrong!");
      DialogHelper.showErrorDialog(description: "Something went wrong!");
      return incomingData;
    }
  }

  Future<Result> getTopics(apiParameter, customBaseUrl) async {
    Result incomingData = Result.loading("Loading");
    try {
      final response = await client.request(
        requestType: RequestType.GET,
        customBaseUrl: customBaseUrl,
        path: UnSplashAPIPathHelper.getValue(UnSplashAPIPath.topics),
        parameter: {"per_page": "30"},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        List<Topics> unPlashResponseList = [];
        for (var i = 0; i < data.length; i++) {
          Topics unPlashResponse = Topics.fromJson(data[i]);
          unPlashResponseList.add(unPlashResponse);
        }
        incomingData = Result<List<Topics>>.success(unPlashResponseList);
        return incomingData;
      } else {
        DialogHelper.showErrorDialog(description: response.body.toString());
        incomingData = Result.error(response.statusCode);
        return incomingData;
      }
    } catch (error) {
      incomingData = Result.error("Something went wrong!");
      DialogHelper.showErrorDialog(description: "Something went wrong!");
      return incomingData;
    }
  }

  Future<Result> getTopicImages(
    String customBaseUrl,
    Map<String, String>? params,
  ) async {
    Result incomingData = Result.loading("Loading");
    try {
      final response = await client.request(
        requestType: RequestType.GET,
        params: params,
        path: UnSplashAPIPathHelper.getValue(UnSplashAPIPath.topics),
        customBaseUrl: customBaseUrl,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        List<UnsplashResponse> unPlashResponseList = [];
        for (var i = 0; i < data.length; i++) {
          UnsplashResponse unPlashResponse = UnsplashResponse.fromJson(data[i]);
          unPlashResponseList.add(unPlashResponse);
        }
        incomingData = Result<List<UnsplashResponse>>.success(
          unPlashResponseList,
        );
        return incomingData;
      } else {
        DialogHelper.showErrorDialog(description: response.body.toString());
        incomingData = Result.error(response.statusCode);
        return incomingData;
      }
    } catch (error) {
      incomingData = Result.error("Something went wrong!");
      DialogHelper.showErrorDialog(description: "Something went wrong!");
      return incomingData;
    }
  }

  Future<Result> getSelectedImage(String path) async {
    Result incomingData = Result.loading("Loading");
    try {
      final response = await client.request(
        requestType: RequestType.GET,
        path:
            "${UnSplashAPIPathHelper.getValue(UnSplashAPIPath.getSelectedImage)}$path",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        SelectedImageResponse selectedImageResponse =
            SelectedImageResponse.fromJson(data);
        incomingData = Result<SelectedImageResponse>.success(
          selectedImageResponse,
        );
        return incomingData;
      } else {
        DialogHelper.showErrorDialog(description: response.body.toString());
        incomingData = Result.error(response.statusCode);
        return incomingData;
      }
    } catch (error) {
      incomingData = Result.error("Something went wrong!");
      DialogHelper.showErrorDialog(description: "Something went wrong!");
      return incomingData;
    }
  }
}
