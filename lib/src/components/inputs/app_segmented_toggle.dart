import 'package:flutter/material.dart';

import '../../tokens/app_radii.dart';
import '../../tokens/app_spacing.dart';

class AppSegmentedToggle extends StatelessWidget {
  const AppSegmentedToggle({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: AppRadii.md,
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Row(
        children: [
          for (int i = 0; i < labels.length; i++)
            Expanded(child: _segment(context, i)),
        ],
      ),
    );
  }

  Widget _segment(BuildContext context, int index) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final bool selected = index == selectedIndex;

    return GestureDetector(
      onTap: () => onChanged(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        decoration: BoxDecoration(
          color: selected ? colors.surfaceContainerLowest : Colors.transparent,
          borderRadius: AppRadii.sm,
          boxShadow: selected
              ? const <BoxShadow>[
                  BoxShadow(
                    color: Color(0x10000000),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          labels[index],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: selected ? colors.primary : colors.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
