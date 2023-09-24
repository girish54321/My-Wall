import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reqres_app/network/util/helper.dart';

class DownloadButton extends StatelessWidget {
  final String url;
  const DownloadButton({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> startDownload() async {
      //     await getApplicationDocumentsDirectory();
      final Directory? downloadsDir = await getDownloadsDirectory();
      await FlutterDownloader.enqueue(
          url: url,
          savedDir: downloadsDir!.path,
          // saveInPublicStorage: true,
          fileName: "${Helper().getFileName(5)}.png",
          showNotification:
              true, // show download progress in status bar (for Android)
          openFileFromNotification: true);
      const snackBar = SnackBar(
        content: Text('Yay! Image Saved!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return FloatingActionButton(
      child: const Icon(Icons.download),
      onPressed: startDownload,
    );
  }
}
