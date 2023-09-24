import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:octo_image/octo_image.dart';
import 'package:reqres_app/App/ImageView/FullImageView.dart';
import 'package:reqres_app/App/ProfileScreen/ProfileScreen.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/model/downloadOption.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:reqres_app/widget/downloadButton.dart';

const style = TextStyle(color: Colors.white);

class ImageView extends StatefulWidget {
  final UnsplashResponse? unPlashResponse;

  const ImageView({required this.unPlashResponse});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  List<DownloadOption> downloadOptionList = [];

  createUrlList() async {
    List urls = [
      {
        "type": "Small",
        "url": widget.unPlashResponse?.urls?.small,
      },
      {
        "type": "Regular",
        "url": widget.unPlashResponse?.urls?.regular,
      },
      {
        "type": "Full",
        "url": widget.unPlashResponse?.urls?.full,
      },
      {"type": "Raw", "url": widget.unPlashResponse?.urls?.raw}
    ];

    for (var i = 0; i < urls.length; i++) {
      http.Response r = await http.head(Uri.parse(urls[i]['url']));
      DownloadOption downloadOption = DownloadOption(
          urls[i]['url'], urls[i]['type'], r.headers["content-length"]!);
      setState(() {
        downloadOptionList.add(downloadOption);
      });
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                      widget.unPlashResponse?.urls?.small ?? "",
                    ),
                    errorBuilder: OctoError.icon(color: Colors.red),
                    fit: BoxFit.contain,
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
                          style: style,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: (() {
                          Helper().goToPage(
                              context: context,
                              child: ProfileScreen(
                                  user: widget.unPlashResponse?.user));
                        }),
                        contentPadding: const EdgeInsets.only(top: 8),
                        title: Text(
                          widget.unPlashResponse?.user?.name ?? "",
                          style: style,
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(widget.unPlashResponse
                                  ?.user?.profileImage?.medium ??
                              ""),
                        ),
                      ),
                      const Divider(),
                      Text(
                        widget.unPlashResponse?.user?.bio ?? "",
                        style: style,
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
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Helper().goBack();
                      },
                      icon: const Icon(
                        Icons.close,
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
                        style: style,
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
