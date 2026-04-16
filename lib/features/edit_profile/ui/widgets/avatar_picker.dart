import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarPicker extends StatelessWidget {
  final String? networkAvatarUrl;
  final String? localAvatarPath;
  final VoidCallback onPickAvatar;

  const AvatarPicker({
    super.key,
    this.networkAvatarUrl,
    this.localAvatarPath,
    required this.onPickAvatar,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: GestureDetector(
        onTap: onPickAvatar,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 50.r,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              child: ClipOval(child: _buildImage(theme)),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 30.r,
                height: 30.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.colorScheme.primary,
                  border: Border.all(
                    color: theme.scaffoldBackgroundColor,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 16.sp,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(ThemeData theme) {
    if (localAvatarPath != null) {
      return Image.file(
        File(localAvatarPath!),
        width: 100.r,
        height: 100.r,
        fit: BoxFit.cover,
      );
    }
    if (networkAvatarUrl != null) {
      return CachedNetworkImage(
        imageUrl: networkAvatarUrl!,
        width: 100.r,
        height: 100.r,
        fit: BoxFit.cover,
        placeholder: (_, _) => _buildIcon(theme),
        errorWidget: (_, _, _) => _buildIcon(theme),
      );
    }
    return _buildIcon(theme);
  }

  Widget _buildIcon(ThemeData theme) {
    return SizedBox(
      width: 100.r,
      height: 100.r,
      child: Icon(
        Icons.person,
        size: 50.sp,
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}
