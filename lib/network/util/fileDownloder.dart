import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

class FileDownloader {
  Future<bool> saveImage(String imageUrl) async {
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(imageUrl);
      if (imageId == null) {
        return false;
      }
      // Below is a method of obtaining saved image information.
      // var fileName = await ImageDownloader.findName(imageId);
      // var path = await ImageDownloader.findPath(imageId);
      // var size = await ImageDownloader.findByteSize(imageId);
      // var mimeType = await ImageDownloader.findMimeType(imageId);
      return true;
    } on PlatformException catch (error) {
      print(error);
      return false;
    }
  }
}
