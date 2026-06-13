import 'package:flutter/material.dart';

import '../../tokens/app_spacing.dart';

class AppBrandLogo extends StatelessWidget {
  const AppBrandLogo({
    super.key,
    this.brandName = 'Housing',
    this.icon = Icons.shield_outlined,
  });

  final String brandName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: colors.primary, size: 26),
        const SizedBox(width: AppSpacing.sm),
        Text(
          brandName,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
        ),
      ],
    );
  }
}
