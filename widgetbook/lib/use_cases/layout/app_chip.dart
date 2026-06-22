import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Layout';

@UseCase(name: 'Default', type: AppChip, path: _path)
Widget chipDefault(BuildContext context) {
  return boxed(const AppChip(label: '2 dormitorios'));
}

@UseCase(name: 'With icon', type: AppChip, path: _path)
Widget chipWithIcon(BuildContext context) {
  return boxed(const AppChip(label: 'Wifi', icon: Icons.wifi_rounded));
}

@UseCase(name: 'Tappable', type: AppChip, path: _path)
Widget chipTappable(BuildContext context) {
  return boxed(
    AppChip(label: 'Amoblado', icon: Icons.chair_outlined, onTap: () {}),
  );
}

@UseCase(name: 'Custom color', type: AppChip, path: _path)
Widget chipCustomColor(BuildContext context) {
  final ColorScheme cs = Theme.of(context).colorScheme;
  return boxed(
    AppChip(
      label: 'Disponible',
      icon: Icons.check_rounded,
      color: cs.primary,
      foregroundColor: cs.onPrimary,
    ),
  );
}

@UseCase(name: 'Wrap of chips', type: AppChip, path: _path)
Widget chipWrap(BuildContext context) {
  return boxed(
    Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: const [
        AppChip(label: '2 dormitorios', icon: Icons.bed_outlined),
        AppChip(label: 'Wifi', icon: Icons.wifi_rounded),
        AppChip(label: 'Amoblado', icon: Icons.chair_outlined),
        AppChip(label: 'Garaje', icon: Icons.garage_outlined),
      ],
    ),
  );
}

@UseCase(name: 'Playground', type: AppChip, path: _path)
Widget chipPlayground(BuildContext context) {
  final ColorScheme cs = Theme.of(context).colorScheme;
  final bool custom = context.knobs.boolean(label: 'Custom colors');
  return boxed(
    AppChip(
      label: context.knobs.string(label: 'Label', initialValue: 'Amoblado'),
      icon: iconKnobOrNull(context, label: 'icon', initiallyOn: true),
      onTap: context.knobs.boolean(label: 'Tappable') ? () {} : null,
      color: custom
          ? context.knobs.color(label: 'Background', initialValue: cs.primary)
          : null,
      foregroundColor: custom
          ? context.knobs.color(label: 'Foreground', initialValue: cs.onPrimary)
          : null,
    ),
  );
}
