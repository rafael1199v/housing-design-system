import 'package:flutter/material.dart';

class AppFieldLabel extends StatelessWidget {
  const AppFieldLabel({
    super.key,
    required this.text,
    this.uppercase = false,
    this.trailing,
  });

  final String text;
  final bool uppercase;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final TextStyle? style = uppercase
        ? textTheme.labelSmall?.copyWith(color: colors.onSurfaceVariant)
        : textTheme.labelLarge?.copyWith(
            fontSize: 13,
            color: colors.onSurface,
          );

    return Row(
      children: [
        Expanded(
          child: Text(uppercase ? text.toUpperCase() : text, style: style),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}
