import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/community/ui/widgets/community_category_chips.dart';
import 'package:gaza_tech/features/community/ui/widgets/community_search_bar.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card.dart';

class CommunityScreen extends StatefulWidget {
  final ScrollController scrollController;

  const CommunityScreen({super.key, required this.scrollController});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int _selectedCategory = 0;

  // Mock data for post interactions
  late final List<bool> _likedPosts;
  late final List<bool> _bookmarkedPosts;

  @override
  void initState() {
    super.initState();
    _likedPosts = List.generate(
      _mockPosts.length,
      (i) => _mockPosts[i]['isLiked'] as bool,
    );
    _bookmarkedPosts = List.generate(
      _mockPosts.length,
      (i) => _mockPosts[i]['isBookmarked'] as bool,
    );
  }

  String _resolveTimeAgo(BuildContext context, String type, int value) {
    final l10n = context.l10n;
    switch (type) {
      case 'hours':
        return l10n.hoursAgo(value);
      case 'day':
        return l10n.dayAgo;
      case 'days':
        return l10n.daysAgo(value);
      default:
        return l10n.daysAgo(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      context.l10n.categoryAll,
      context.l10n.questions,
      context.l10n.tips,
      context.l10n.news,
      context.l10n.troubleshooting,
    ];

    return CustomScrollView(
      controller: widget.scrollController,
      slivers: [
        SliverAppBar(
          title: Text(context.l10n.community),
          floating: true,
          snap: true,
          actions: [
            IconButton(
              icon: Icon(Icons.person_outline, size: 26.sp),
              onPressed: () {},
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: const CommunitySearchBar(),
              ),
              SizedBox(height: 4.h),
              CommunityCategoryChips(
                categories: categories,
                selectedIndex: _selectedCategory,
                onCategoryChanged: (index) {
                  setState(() => _selectedCategory = index);
                },
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final post = _mockPosts[index];
            return PostCard(
              userName: post['userName'] as String,
              timeAgo: _resolveTimeAgo(
                context,
                post['timeAgoType'] as String,
                post['timeAgoValue'] as int,
              ),
              category: post['category'] as String,
              title: post['title'] as String,
              description: post['description'] as String,
              likes: post['likes'] as int,
              comments: post['comments'] as int,
              isLiked: _likedPosts[index],
              isBookmarked: _bookmarkedPosts[index],
              onLikeToggle: () {
                setState(() => _likedPosts[index] = !_likedPosts[index]);
              },
              onBookmarkToggle: () {
                setState(
                  () => _bookmarkedPosts[index] = !_bookmarkedPosts[index],
                );
              },
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.postDetails);
              },
            );
          }, childCount: _mockPosts.length),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 100.h)),
      ],
    );
  }
}

const List<Map<String, Object>> _mockPosts = [
  {
    'userName': 'Ahmed e assan',
    'timeAgoType': 'hours',
    'timeAgoValue': 2,
    'category': 'question',
    'title': 'Best laptop for programming under \$800?',
    'description':
        'I\'m looking for a reliable laptop for web development and coding. Any...',
    'likes': 24,
    'comments': 12,
    'isLiked': false,
    'isBookmarked': false,
  },
  {
    'userName': 'Sara Mahmoud',
    'timeAgoType': 'hours',
    'timeAgoValue': 5,
    'category': 'tips',
    'title': '5 Tips to Extend Your Phone Battery Life',
    'description':
        'Here are some practical tips I\'ve been using to make my phone battery last longer throughou...',
    'likes': 156,
    'comments': 43,
    'isLiked': true,
    'isBookmarked': true,
  },
  {
    'userName': 'Omar Khalil',
    'timeAgoType': 'day',
    'timeAgoValue': 1,
    'category': 'news',
    'title': 'New iPhone 15 Pro Features Announced',
    'description':
        'Apple just announced the iPhone 15 Pro with some amazing features including USB port,...',
    'likes': 89,
    'comments': 67,
    'isLiked': false,
    'isBookmarked': false,
  },
  {
    'userName': 'Youssef Ali',
    'timeAgoType': 'days',
    'timeAgoValue': 2,
    'category': 'troubleshooting',
    'title': 'MacBook won\'t connect to WiFi - SOLVED',
    'description':
        'After hours of troubleshooting, I finally fixed my MacBook WiFi issue. Here\'s what worked for...',
    'likes': 45,
    'comments': 28,
    'isLiked': false,
    'isBookmarked': false,
  },
  {
    'userName': 'Layla Ibrahim',
    'timeAgoType': 'days',
    'timeAgoValue': 3,
    'category': 'question',
    'title': 'Which mechanical keyboard do you recommend?',
    'description':
        'I want to upgrade to a mechanical keyboard for typing and gaming. What switches and brand...',
    'likes': 32,
    'comments': 19,
    'isLiked': false,
    'isBookmarked': false,
  },
];
