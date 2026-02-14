import 'package:flutter/material.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';

class MarketplaceScreen extends StatefulWidget {
  final ScrollController scrollController;

  const MarketplaceScreen({super.key, required this.scrollController});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.scrollController,
      slivers: [
        SliverAppBar(
          title: Text(context.l10n.marketplace),
          floating: true,
          snap: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(
                  onTap: () => context.pushNamed(MyRoutes.listingDetails),
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                    child: Icon(
                      Icons.shopping_bag,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  title: Text('Product ${index + 1}'),
                  subtitle: Text(context.l10n.marketplaceContent),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
              );
            }, childCount: 50),
          ),
        ),
      ],
    );
  }
}
