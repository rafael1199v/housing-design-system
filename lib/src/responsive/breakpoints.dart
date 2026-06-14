import 'package:flutter/widgets.dart';

enum WindowSize { compact, medium, expanded }

abstract final class Breakpoints {
  Breakpoints._();

  static const double mediumMin = 600;
  static const double expandedMin = 900;

  static WindowSize of(double width) {
    if (width >= expandedMin) return WindowSize.expanded;
    if (width >= mediumMin) return WindowSize.medium;
    return WindowSize.compact;
  }

  static WindowSize ofContext(BuildContext context) =>
      of(MediaQuery.sizeOf(context).width);

  static bool isCompact(BuildContext context) =>
      ofContext(context) == WindowSize.compact;

  static bool isExpanded(BuildContext context) =>
      ofContext(context) == WindowSize.expanded;
}
