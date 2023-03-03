import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ImageSaver {
  static Future<void> saveImageFromUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.bodyBytes),
        quality: 100,
      );
    } catch (_) {
      print(_.toString());
      rethrow;
    }
  }
}
