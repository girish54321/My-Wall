import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:reqres_app/App/ImageView/imageView.dart';
import 'package:reqres_app/App/TopicImagesScreen/topicImagesScreen.dart';
import 'package:reqres_app/network/dataModel/topic.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:reqres_app/widget/appNetWorkImage%20copy.dart';

class ImageList extends StatelessWidget {
  final List<UnsplashResponse?>? imageList;
  final ScrollController scrollController;
  const ImageList({
    Key? key,
    required this.imageList,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      shrinkWrap: true,
      crossAxisSpacing: 6.5,
      controller: scrollController,
      mainAxisSpacing: 6.5,
      padding: const EdgeInsets.all(
        6.5,
      ),
      itemCount: imageList?.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemBuilder: (context, index) {
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
    );
  }
}

class TopicsList extends StatelessWidget {
  final List<Topics?>? topicList;
  const TopicsList({
    Key? key,
    required this.topicList,
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
            Helper().goToPage(
                context: context, child: TopicImagesScreen(topics: item));
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
