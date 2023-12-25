import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:reqres_app/network/model/loading.dart';
import 'package:reqres_app/network/util/helper.dart';

class LoadingView extends StatefulWidget {
  final bool? isSliver;

  const LoadingView({Key? key, this.isSliver}) : super(key: key);

  @override
  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  List<LoadingElement?>? loading = [];

  _getLoadingData() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/loading.json");
    final jsonResult = json.decode(data);
    Loading l = Loading.fromJson(jsonResult);
    setState(() {
      loading = l.loading;
    });
  }

  @override
  void initState() {
    _getLoadingData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
        shrinkWrap: true,
        crossAxisSpacing: 6.5,
        mainAxisSpacing: 6.5,
        padding: const EdgeInsets.all(
          6.5,
        ),
        itemCount: loading!.length,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          LoadingElement? loadingElement = loading?[index];
          return Helper().loadingItem(loadingElement, index);
        });
  }
}
