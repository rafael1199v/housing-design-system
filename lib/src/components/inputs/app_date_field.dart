import 'package:flutter/material.dart';

import '../../tokens/app_spacing.dart';
import 'app_field_label.dart';

class AppDateField extends StatelessWidget {
  const AppDateField({
    super.key,
    this.value,
    this.onChanged,
    this.label,
    this.hintText,
    this.prefixIcon = Icons.calendar_today_outlined,
    this.errorText,
    this.enabled = true,
    this.uppercaseLabel = false,
    this.firstDate,
    this.lastDate,
    this.formatLabel,
  });

  final DateTime? value;
  final ValueChanged<DateTime>? onChanged;

  final String? label;
  final String? hintText;
  final IconData? prefixIcon;
  final String? errorText;
  final bool enabled;
  final bool uppercaseLabel;

  final DateTime? firstDate;
  final DateTime? lastDate;
  final String Function(DateTime value)? formatLabel;

  String _defaultFormat(DateTime date) {
    final mm = date.month.toString().padLeft(2, '0');
    final dd = date.day.toString().padLeft(2, '0');
    return '$mm/$dd/${date.year}';
  }

  Future<void> _pick(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime first = firstDate ?? DateTime(now.year - 120);
    final DateTime last = lastDate ?? now;
    final DateTime initial = value ?? DateTime(now.year - 18);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initial.isAfter(last) ? last : initial,
      firstDate: first,
      lastDate: last,
    );
    if (picked != null) onChanged?.call(picked);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final String? text = value == null
        ? null
        : (formatLabel ?? _defaultFormat)(value!);

    final Widget field = InkWell(
      onTap: enabled ? () => _pick(context) : null,
      child: InputDecorator(
        isEmpty: text == null,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon == null ? null : Icon(prefixIcon, size: 20),
          errorText: errorText,
          suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, size: 22),
        ),
        child: Text(
          text ?? '',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: text == null ? colors.onSurfaceVariant : colors.onSurface,
              ),
        ),
      ),
    );

    if (label == null) return field;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppFieldLabel(text: label!, uppercase: uppercaseLabel),
        const SizedBox(height: AppSpacing.sm),
        field,
      ],
    );
  }
}
