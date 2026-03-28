import 'dart:io';

sealed class ListingImageItem {}

class ExistingImage extends ListingImageItem {
  final String url;
  ExistingImage(this.url);
}

class NewImage extends ListingImageItem {
  final File file;
  NewImage(this.file);
}
