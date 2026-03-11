import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;

  const ImageCarousel({
    super.key,
    required this.imageUrls,
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

  Widget _buildImagePlaceholder() {
    return Container(
      color: MyColors.dark.outline,
      child: Center(
        child: Icon(Icons.image_outlined, size: 80.sp, color: Colors.white54),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageCount = widget.imageUrls.isEmpty ? 1 : widget.imageUrls.length;

    return Stack(
      children: [
        SizedBox(
          height: 400.h,
          width: double.infinity,
          child: widget.imageUrls.isEmpty
              ? _buildImagePlaceholder()
              : PageView.builder(
                  controller: _pageController,
                  itemCount: imageCount,
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemBuilder: (context, index) => CachedNetworkImage(
                    imageUrl: widget.imageUrls[index],
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: (context, url) => Container(
                      color: MyColors.dark.outline,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: MyColors.dark.outline,
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 80.sp,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                  ),
                ),
        ),
        // Page indicator dots (only show if multiple images)
        if (widget.imageUrls.length > 1)
          Positioned(
            bottom: 16.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imageCount,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  width: _currentPage == i ? 24.w : 8.w,
                  height: 8.w,
                  decoration: BoxDecoration(
                    color: _currentPage == i
                        ? MyColors.primary.base
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
                    ? MyColors.primary.base
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
