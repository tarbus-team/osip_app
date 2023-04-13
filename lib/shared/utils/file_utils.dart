import 'package:flutter/services.dart';

class FileUtils {
  static Future<String?> getAssetFileContent(String path) async {
    try {
      return await rootBundle.loadString(path);
    } catch (e) {
      return null;
    }
  }
}