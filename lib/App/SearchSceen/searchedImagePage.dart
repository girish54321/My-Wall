import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/GetxControllers/SearchScreenController.dart';
import 'package:reqres_app/widget/imageList.dart';
import 'package:reqres_app/widget/loadingView.dart';

class SearchedImagePage extends StatefulWidget {
  const SearchedImagePage({Key? key}) : super(key: key);

  @override
  _SearchedImagePageState createState() => _SearchedImagePageState();
}

class _SearchedImagePageState extends State<SearchedImagePage> {
  String searchText = "";
  int pageNumber = 1;
  final TextEditingController _controller = TextEditingController();

  final SearchScreenController searchScreenController =
      Get.put(SearchScreenController());
  final ScrollController _scrollController = ScrollController();

  void loadMoreImages() {
    searchScreenController.getImage(_controller.text);
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
              searchScreenController.clearState();
              searchScreenController.getImage(text);
            },
            controller: _controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              hintText: "Search Images",
              suffixIcon: IconButton(
                onPressed: () {
                  searchScreenController.clearState();
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
      body: Obx((() => searchScreenController.searchScreenImage.isEmpty
          ? searchScreenController.searchScreenImage.isEmpty &&
                  searchScreenController.searchScreenLoading.value
              ? const LoadingView()
              : const Center(child: Text("Search You image"))
          : ImageList(
              isLoading: searchScreenController.searchScreenLoading.value,
              imageList: searchScreenController.searchScreenImage,
              scrollController: _scrollController,
            ))),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    searchScreenController.clearState();
    super.dispose();
  }
}
