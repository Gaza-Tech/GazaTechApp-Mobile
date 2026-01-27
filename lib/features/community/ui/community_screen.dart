import 'package:flutter/material.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';

class CommunityScreen extends StatelessWidget {
  final ScrollController scrollController;

  const CommunityScreen({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          title: Text(context.l10n.community),
          floating: true,
          snap: true,
          elevation: 2,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                      child: Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                    title: Text('User ${index + 1}'),
                    subtitle: Text(context.l10n.communityContent),
                    trailing: const Icon(Icons.chat_bubble_outline, size: 20),
                  ),
                );
              },
              childCount: 50,
            ),
          ),
        ),
      ],
    );
  }
}
