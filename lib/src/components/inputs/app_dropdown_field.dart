import 'package:flutter/material.dart';

import '../../tokens/app_spacing.dart';
import 'app_field_label.dart';

class AppDropdownItem<T> {
  const AppDropdownItem({
    required this.value,
    required this.label,
    this.selectedLabel,
  });

  final T value;
  final String label;
  final String? selectedLabel;
}

class AppDropdownField<T> extends StatelessWidget {
  const AppDropdownField({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.label,
    this.hintText,
    this.prefixIcon,
    this.errorText,
    this.enabled = true,
    this.uppercaseLabel = false,
    this.labelTrailing,
  });

  final List<AppDropdownItem<T>> items;
  final T? value;
  final ValueChanged<T?>? onChanged;

  final String? label;
  final String? hintText;
  final IconData? prefixIcon;
  final String? errorText;
  final bool enabled;
  final bool uppercaseLabel;
  final Widget? labelTrailing;

  AppDropdownItem<T>? get _selected {
    for (final item in items) {
      if (item.value == value) return item;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final TextStyle? textStyle = Theme.of(context).textTheme.bodyLarge;

    final AppDropdownItem<T>? selected = _selected;
    final String? selectedText = selected?.selectedLabel ?? selected?.label;

    final double maxMenuHeight = MediaQuery.sizeOf(context).height * 0.4;

    final Widget field = LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;

        return MenuAnchor(
          crossAxisUnconstrained: false,
          style: MenuStyle(
            minimumSize: WidgetStatePropertyAll(Size(width, 0)),
            maximumSize: WidgetStatePropertyAll(Size(width, maxMenuHeight)),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(vertical: AppSpacing.xs),
            ),
          ),
          builder: (context, controller, _) {
            return InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: enabled
                  ? () => controller.isOpen
                        ? controller.close()
                        : controller.open()
                  : null,
              child: InputDecorator(
                isEmpty: selectedText == null,
                decoration: InputDecoration(
                  hintText: hintText,
                  errorText: errorText,
                  prefixIcon: prefixIcon == null
                      ? null
                      : Icon(prefixIcon, size: 20),
                  suffixIcon: Icon(
                    controller.isOpen
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    size: 22,
                  ),
                ),
                child: Text(
                  selectedText ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle?.copyWith(color: colors.onSurface),
                ),
              ),
            );
          },
          menuChildren: [
            for (final item in items)
              MenuItemButton(
                style: MenuItemButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                  ),
                  minimumSize: const Size.fromHeight(44),
                ),
                onPressed: enabled ? () => onChanged?.call(item.value) : null,
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(item.label, style: textStyle),
                ),
              ),
          ],
        );
      },
    );

    if (label == null) return field;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppFieldLabel(
          text: label!,
          uppercase: uppercaseLabel,
          trailing: labelTrailing,
        ),
        const SizedBox(height: AppSpacing.sm),
        field,
      ],
    );
  }
}
