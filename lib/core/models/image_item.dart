import 'dart:io';

sealed class ImageItem {}

class ExistingImage extends ImageItem {
  final String url;
  ExistingImage(this.url);
}

class NewImage extends ImageItem {
  final File file;
  NewImage(this.file);
}
