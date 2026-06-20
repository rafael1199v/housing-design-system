import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Buttons';

@UseCase(name: 'Default', type: AppSecondaryButton, path: _path)
Widget secondaryButtonDefault(BuildContext context) {
  return boxed(AppSecondaryButton(label: 'Cancelar', onPressed: () {}));
}

@UseCase(name: 'With icon', type: AppSecondaryButton, path: _path)
Widget secondaryButtonWithIcon(BuildContext context) {
  return boxed(
    AppSecondaryButton(
      label: 'Filtrar',
      icon: Icons.tune_rounded,
      onPressed: () {},
    ),
  );
}

@UseCase(name: 'Expanded', type: AppSecondaryButton, path: _path)
Widget secondaryButtonExpanded(BuildContext context) {
  return boxed(
    AppSecondaryButton(label: 'Volver', expanded: true, onPressed: () {}),
  );
}

@UseCase(name: 'Disabled', type: AppSecondaryButton, path: _path)
Widget secondaryButtonDisabled(BuildContext context) {
  return boxed(const AppSecondaryButton(label: 'Cancelar'));
}

@UseCase(name: 'Playground', type: AppSecondaryButton, path: _path)
Widget secondaryButtonPlayground(BuildContext context) {
  final bool enabled =
      context.knobs.boolean(label: 'Enabled', initialValue: true);
  return boxed(
    AppSecondaryButton(
      label: context.knobs.string(label: 'Label', initialValue: 'Cancelar'),
      expanded: context.knobs.boolean(label: 'Expanded'),
      icon: iconKnobOrNull(context, label: 'leading icon'),
      onPressed: enabled ? () {} : null,
    ),
  );
}
