import 'listing_model.dart';

class ListingsResponse {
  final List<ListingModel> listings;
  final int totalCount;
  final bool hasMore;

  ListingsResponse({
    required this.listings,
    required this.totalCount,
    required this.hasMore,
  });
}
