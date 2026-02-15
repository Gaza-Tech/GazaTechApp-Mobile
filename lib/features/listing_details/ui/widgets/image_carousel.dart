import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';

class ImageCarousel extends StatefulWidget {
  final int imageCount;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;

  const ImageCarousel({
    super.key,
    required this.imageCount,
    required this.isBookmarked,
    required this.onBookmarkToggle,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 320.h,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imageCount,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) => Container(
              color: MyColors.neutral.dark.medium,
              child: Center(
                child: Icon(
                  Icons.laptop_mac,
                  size: 80.sp,
                  color: Colors.white54,
                ),
              ),
            ),
          ),
        ),
        // Page indicator dots
        Positioned(
          bottom: 16.h,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.imageCount,
              (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                width: _currentPage == i ? 24.w : 8.w,
                height: 8.w,
                decoration: BoxDecoration(
                  color: _currentPage == i
                      ? MyColors.highlight.darkest
                      : Colors.white.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(4.dg),
                ),
              ),
            ),
          ),
        ),
        // Bookmark button
        Positioned(
          top: MediaQuery.of(context).padding.top + kToolbarHeight - 36.h,
          right: 8.w,
          child: GestureDetector(
            onTap: widget.onBookmarkToggle,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: widget.isBookmarked
                    ? MyColors.highlight.darkest
                    : Colors.white,
                size: 22.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
