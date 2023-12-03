import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:reqres_app/App/ImageView/FullImageView.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:reqres_app/widget/downloadButton.dart';

class ImageView extends StatefulWidget {
  final UnsplashResponse? unPlashResponse;

  const ImageView({required this.unPlashResponse});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                      // const Divider(),
                      // TODO: User Profile View
                      // ListTile(
                      //   onTap: (() {
                      //     Helper().goToPage(
                      //         context: context,
                      //         child: ProfileScreen(
                      //             user: widget.unPlashResponse?.user));
                      //   }),
                      //   contentPadding: const EdgeInsets.only(top: 8),
                      //   title: Text(
                      //     widget.unPlashResponse?.user?.name ?? "",
                      //     style: style,
                      //   ),
                      //   leading: CircleAvatar(
                      //     backgroundImage: NetworkImage(widget.unPlashResponse
                      //             ?.user?.profileImage?.medium ??
                      //         ""),
                      //   ),
                      // ),
                      const Divider(),
                      Text(
                        widget.unPlashResponse?.user?.bio ?? "",
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
                  Row(
                    children: [
                      const Icon(Icons.thumb_up, color: Colors.white),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        widget.unPlashResponse?.likes.toString() ?? "",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: DownloadButton(
        url: widget.unPlashResponse?.urls?.regular ?? "",
      ),
    );
  }
}
