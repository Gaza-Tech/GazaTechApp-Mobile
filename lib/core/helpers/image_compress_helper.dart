import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ImageCompressHelper {
  ImageCompressHelper._();

  /// Compress a single image to WebP format.
  /// Returns the compressed [File], or the original [file] if compression fails.
  static Future<File> compressToWebp(
    File file, {
    int quality = 80,
    int maxWidth = 1080,
    int maxHeight = 1080,
  }) async {
    try {
      final dir = await getTemporaryDirectory();
      final targetPath = p.join(
        dir.path,
        '${DateTime.now().millisecondsSinceEpoch}'
        '_${p.basenameWithoutExtension(file.path)}.webp',
      );

      final result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: quality,
        minWidth: maxWidth,
        minHeight: maxHeight,
        format: CompressFormat.webp,
      );

      if (result == null) return file;
      return File(result.path);
    } catch (_) {
      return file;
    }
  }

  /// Compress multiple images to WebP. Convenience wrapper.
  static Future<List<File>> compressMultipleToWebp(
    List<File> files, {
    int quality = 80,
    int maxWidth = 1080,
    int maxHeight = 1080,
  }) async {
    final results = <File>[];
    for (final file in files) {
      final compressed = await compressToWebp(
        file,
        quality: quality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );
      results.add(compressed);
    }
    return results;
  }
}
