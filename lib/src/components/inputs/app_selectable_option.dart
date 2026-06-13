import 'package:flutter/material.dart';

import '../../tokens/app_radii.dart';
import '../../tokens/app_spacing.dart';

class AppSelectableOption extends StatelessWidget {
  const AppSelectableOption({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    final Color fg = selected ? colors.onPrimary : colors.onSurface;
    final Color bg = selected ? colors.primary : colors.surfaceContainerLowest;
    final Color border = selected ? colors.primary : colors.outlineVariant;

    return Material(
      color: bg,
      borderRadius: AppRadii.md,
      child: InkWell(
        borderRadius: AppRadii.md,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            borderRadius: AppRadii.md,
            border: Border.all(color: border),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 24, color: fg),
              const SizedBox(height: AppSpacing.sm),
              Flexible(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: fg,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
