import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:reqres_app/App/ImageView/imageView.dart';
import 'package:reqres_app/App/TopicImageScreen/TopicImageScreen.dart';
import 'package:reqres_app/network/dataModel/topic.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:reqres_app/widget/appNetWorkImage%20copy.dart';

class ImageList extends StatelessWidget {
  final List<UnsplashResponse?>? imageList;
  final ScrollController? scrollController;
  final bool isLoading;
  const ImageList({
    Key? key,
    required this.imageList,
    required this.scrollController,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (imageList == null || imageList!.isEmpty) {
    //   return const LoadingView();
    // }
    return CustomRefreshIndicator(
      onRefresh: () {
        // ignore: void_checks
        return Future.delayed(const Duration(seconds: 1), () {
          return true;
        });
      },
      builder: MaterialIndicatorDelegate(
        builder: (context, controller) {
          return const Icon(
            Icons.image,
            color: Colors.white,
            size: 30,
          );
        },
      ),
      child: MasonryGridView.builder(
        shrinkWrap: true,
        crossAxisSpacing: 6.5,
        controller: scrollController,
        mainAxisSpacing: 6.5,
        padding: const EdgeInsets.all(
          6.5,
        ),
        itemCount: imageList!.length + 1,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          if (index == imageList!.length) {
            return const Center(child: CircularProgressIndicator());
          }
          UnsplashResponse? item = imageList?[index];
          return InkWell(
            onTap: () {
              Helper().goToPage(
                  context: context, child: ImageView(unPlashResponse: item));
            },
            child: AppNetWorkImage(
              blurHash: item?.blurHash ?? "",
              height: item?.height ?? 10,
              imageUrl: item?.urls?.small ?? "",
              width: item?.width ?? 11,
            ),
          );
        },
      ),
    );
  }
}

class TopicsList extends StatelessWidget {
  final List<Topics?>? topicList;
  final bool isLoading;
  const TopicsList({
    Key? key,
    required this.topicList,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      crossAxisSpacing: 6.5,
      mainAxisSpacing: 6.5,
      padding: const EdgeInsets.all(
        6.5,
      ),
      itemCount: topicList?.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemBuilder: (context, index) {
        Topics? item = topicList?[index];
        return InkWell(
          onTap: () {
            // Get.to(TopicImagesScreen(topics: item));
            Helper().goToPage(
                context: context,
                child: TopicImageScreen(
                  topics: item!,
                ));
            // Get.to(() => TopicImagesScreen(topics: item));
          },
          child: Stack(
            children: [
              AppNetWorkImage(
                blurHash: item?.coverPhoto?.blurHash ?? "",
                height: item?.coverPhoto?.height ?? 10,
                imageUrl: item?.coverPhoto?.urls?.small ?? "",
                width: item?.coverPhoto?.width ?? 10,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  color: Colors.black.withOpacity(0.4),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item?.title ?? "NA",
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
