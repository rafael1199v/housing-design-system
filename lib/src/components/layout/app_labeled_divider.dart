import 'package:flutter/material.dart';

import '../../tokens/app_spacing.dart';

class AppLabeledDivider extends StatelessWidget {
  const AppLabeledDivider({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
