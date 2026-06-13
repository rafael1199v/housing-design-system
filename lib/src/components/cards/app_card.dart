import 'package:flutter/material.dart';

import '../../tokens/app_radii.dart';
import '../../tokens/app_spacing.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
    this.color,
    this.borderRadius = AppRadii.lg,
    this.bordered = false,
    this.shadows,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final BorderRadius borderRadius;

  final bool bordered;
  final List<BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final Color background = color ?? colors.surfaceContainerLowest;

    final Widget content = DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: borderRadius,
        border:
            bordered ? Border.all(color: colors.outlineVariant) : null,
        boxShadow: shadows,
      ),
      child: Padding(padding: padding, child: child),
    );

    if (onTap == null) return content;

    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: content,
      ),
    );
  }
}
