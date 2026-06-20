import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Feedback';

@UseCase(name: 'Default', type: AppStatusBadge, path: _path)
Widget statusBadgeDefault(BuildContext context) {
  return boxed(const AppStatusBadge(label: 'Borrador'));
}

@UseCase(name: 'With icon', type: AppStatusBadge, path: _path)
Widget statusBadgeWithIcon(BuildContext context) {
  return boxed(
    const AppStatusBadge(label: 'Verificado', icon: Icons.check_circle_outline),
  );
}

@UseCase(name: 'Semantic presets', type: AppStatusBadge, path: _path)
Widget statusBadgePresets(BuildContext context) {
  final ColorScheme cs = Theme.of(context).colorScheme;
  final AppSemanticColors sem = semanticsOf(context);
  return boxed(
    Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        AppStatusBadge(
          label: 'Disponible',
          icon: Icons.check_circle_outline,
          foregroundColor: sem.onSuccess,
          backgroundColor: sem.successContainer,
        ),
        AppStatusBadge(
          label: 'Destacado',
          icon: Icons.star_outline_rounded,
          foregroundColor: sem.onAccent,
          backgroundColor: sem.accentContainer,
        ),
        AppStatusBadge(
          label: 'Ocupado',
          icon: Icons.cancel_outlined,
          foregroundColor: cs.onErrorContainer,
          backgroundColor: cs.errorContainer,
        ),
      ],
    ),
  );
}

@UseCase(name: 'Playground', type: AppStatusBadge, path: _path)
Widget statusBadgePlayground(BuildContext context) {
  final ColorScheme cs = Theme.of(context).colorScheme;
  final bool customColors = context.knobs.boolean(label: 'Custom colors');
  return boxed(
    AppStatusBadge(
      label: context.knobs.string(label: 'Label', initialValue: 'Verificado'),
      icon: iconKnobOrNull(context, label: 'icon', initiallyOn: true),
      foregroundColor: customColors
          ? context.knobs.color(label: 'Foreground', initialValue: cs.onPrimary)
          : null,
      backgroundColor: customColors
          ? context.knobs.color(label: 'Background', initialValue: cs.primary)
          : null,
    ),
  );
}
