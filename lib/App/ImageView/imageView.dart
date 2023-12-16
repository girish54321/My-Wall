import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'package:reqres_app/App/ImageView/FullImageView.dart';
import 'package:reqres_app/App/SearchSceen/searchedImagePage.dart';
import 'package:reqres_app/GetxControllers/SelectedImageGetx.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:reqres_app/widget/dateFormateText.dart';
import 'package:reqres_app/widget/downloadButton.dart';
import 'package:reqres_app/widget/imageInfoView.dart';

class ImageView extends StatefulWidget {
  final UnsplashResponse? unPlashResponse;

  const ImageView({required this.unPlashResponse});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  final SelectedImageController selectedImageController =
      Get.put(SelectedImageController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.only(top: 0),
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () {
                        Helper().goToPage(
                            context: context,
                            child: FullImageView(
                                unPlashResponse: widget.unPlashResponse));
                      },
                      child: InteractiveViewer(
                        child: OctoImage(
                          image: CachedNetworkImageProvider(
                            widget.unPlashResponse?.urls?.small ?? "",
                          ),
                          errorBuilder: OctoError.icon(color: Colors.red),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Text(
                              widget.unPlashResponse?.description ?? "",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Text(
                              widget.unPlashResponse?.altDescription ?? "",
                            ),
                          ),
                          Text(
                            widget.unPlashResponse?.user?.bio ?? "",
                          ),
                          const Divider(),
                          Row(
                            children: [
                              ImageInfoView(
                                title: 'Views',
                                value: selectedImageController
                                        .selectedImageData.value?.views ??
                                    0,
                              ),
                              ImageInfoView(
                                title: 'Likes',
                                value: selectedImageController
                                        .selectedImageData.value?.likes ??
                                    0,
                              ),
                              ImageInfoView(
                                title: 'Downloads',
                                value: selectedImageController
                                        .selectedImageData.value?.downloads ??
                                    0,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6, bottom: 6),
                            child: FormattedDateWidget(
                                dateString:
                                    widget.unPlashResponse?.createdAt ?? ""),
                          ),
                          const Divider(),
                          Wrap(
                            children: [
                              ...?selectedImageController
                                  .selectedImageData.value?.tags!
                                  .map(((e) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 6),
                                  child: GestureDetector(
                                    onTap: () {
                                      Helper().goToPage(
                                          context: context,
                                          child: SearchedImagePage(
                                            autoFileSearch: e?.title,
                                          ));
                                    },
                                    child: Chip(
                                      padding: EdgeInsets.zero,
                                      label: Text(e?.title ?? ""),
                                    ),
                                  ),
                                );
                              })),
                            ],
                          ),
                          const SizedBox(
                            height: 42,
                          )
                        ]),
                  ),
                ],
              ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Helper().goBack();
                          },
                          icon: Icon(
                            Platform.isAndroid
                                ? Icons.arrow_back
                                : Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: DownloadButton(
          url: widget.unPlashResponse?.urls?.regular ?? "",
        ),
      ),
    );
  }
}
