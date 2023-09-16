import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:octo_image/octo_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/model/downloadOption.dart';
import 'package:reqres_app/network/util/helper.dart';

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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: OctoImage(
              image: CachedNetworkImageProvider(
                widget.unPlashResponse?.urls?.small ?? "",
              ),
              errorBuilder: OctoError.icon(color: Colors.red),
              fit: BoxFit.contain,
            ),
          ),
          SafeArea(
              child: IconButton(
                  onPressed: () {
                    Helper().goBack();
                  },
                  icon: const Icon(Icons.close)))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: () async {
          final Directory? downloadsDir =
              await getApplicationDocumentsDirectory();
          // final Directory? downloadsDir = await getDownloadsDirectory();
          print(downloadsDir?.path);
          final Directory savedDir = Directory(downloadsDir?.path ?? "");

          // if (!savedDir.existsSync()) {
          //   // The directory doesn't exist, create it
          //   savedDir.createSync(
          //       recursive:
          //           true); // Use recursive: true to create parent directories if they don't exist
          //   final taskId = await FlutterDownloader.enqueue(
          //       url: widget.unPlashResponse?.urls?.regular ?? "",
          //       savedDir: downloadsDir!.path,
          //       fileName: "${Helper().getFileName(5)}.png",
          //       showNotification:
          //           true, // show download progress in status bar (for Android)
          //       openFileFromNotification: true);
          // }
          final taskId = await FlutterDownloader.enqueue(
              url: widget.unPlashResponse?.urls?.regular ?? "",
              savedDir: downloadsDir!.path,
              saveInPublicStorage: true,
              fileName: "${Helper().getFileName(5)}.png",
              showNotification:
                  true, // show download progress in status bar (for Android)
              openFileFromNotification: true);
          const snackBar = SnackBar(
            content: Text('Yay! Image Saved!'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}
