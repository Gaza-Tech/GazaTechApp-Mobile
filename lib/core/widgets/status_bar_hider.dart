import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class StatusBarHider extends StatefulWidget {
  final Widget child;

  const StatusBarHider({super.key, required this.child});

  @override
  State<StatusBarHider> createState() => _StatusBarHiderState();
}

class _StatusBarHiderState extends State<StatusBarHider> {
  bool _isStatusBarVisible = true;

  @override
  void dispose() {
    // CRITICAL: Reset the status bar when this widget is removed from the tree.
    // This ensures that if the user navigates back, the status bar returns.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  void _toggleStatusBar(bool show) {
    if (show && !_isStatusBarVisible) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      setState(() => _isStatusBarVisible = true);
    } else if (!show && _isStatusBarVisible) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      setState(() => _isStatusBarVisible = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        // Only trigger on the main scroll view, not nested ones (optional safety)
        if (notification.depth != 0) return false;

        if (notification.direction == ScrollDirection.reverse) {
          // User scrolling down -> Hide
          _toggleStatusBar(false);
        } else if (notification.direction == ScrollDirection.forward) {
          // User scrolling up -> Show
          _toggleStatusBar(true);
        }
        return false; // Allow notification to bubble up if needed
      },
      child: widget.child,
    );
  }
}
