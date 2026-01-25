import 'package:flutter/material.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';

class MarketplaceScreen extends StatefulWidget {
  final ScrollController scrollController;

  const MarketplaceScreen({super.key, required this.scrollController});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: widget.scrollController,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
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
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Add new item'),
            duration: Duration(seconds: 1),
          ),
        ),
        icon: const Icon(Icons.add),
        label: Text(context.l10n.addListing),
      ),
    );
  }
}
