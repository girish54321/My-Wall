import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/GetxControllers/SearchScreenGtx/SearchScreenController.dart';
import 'package:reqres_app/widget/imageList.dart';

class SearchedImagePage extends StatefulWidget {
  @override
  _SearchedImagePageState createState() => _SearchedImagePageState();
}

class _SearchedImagePageState extends State<SearchedImagePage> {
  String searchText = "";
  int pageNumber = 1;
  final TextEditingController _controller = TextEditingController();

  final SearchScreenController homeController =
      Get.put(SearchScreenController());
  final ScrollController _scrollController = ScrollController();

  void loadMoreImages() {
    homeController.getImage(_controller.text);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        loadMoreImages();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 42,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          ),
          child: TextField(
            onSubmitted: (text) {
              homeController.clearState();
              homeController.getImage(text);
            },
            controller: _controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              hintText: "Search Images",
              suffixIcon: IconButton(
                onPressed: () {
                  homeController.clearState();
                  _controller.text = "";
                },
                icon: const Icon(
                  Icons.clear,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Obx((() => homeController.homeScreenImage.isEmpty
          ? const Center(child: Text("Search You image"))
          : ImageList(
              isLoading: homeController.homeScreenLoading.value,
              imageList: homeController.homeScreenImage,
              scrollController: _scrollController,
            ))),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    homeController.clearState();
    super.dispose();
  }
}
