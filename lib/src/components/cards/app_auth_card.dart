import 'package:flutter/material.dart';

import '../../responsive/breakpoints.dart';
import '../../tokens/app_elevation.dart';
import '../../tokens/app_radii.dart';
import '../../tokens/app_spacing.dart';

class AppAuthCard extends StatelessWidget {
  const AppAuthCard({super.key, required this.child, this.maxWidth = 440});

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final bool isCompact = Breakpoints.isCompact(context);

    final Widget content = ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.xxl,
        ),
        child: child,
      ),
    );

    if (isCompact) {
      return SafeArea(
        child: Center(child: SingleChildScrollView(child: content)),
      );
    }

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.surfaceContainerLowest,
            borderRadius: AppRadii.lg,
            border: Border.all(color: colors.outlineVariant),
            boxShadow: AppElevation.level3,
          ),
          child: content,
        ),
      ),
    );
  }
}
