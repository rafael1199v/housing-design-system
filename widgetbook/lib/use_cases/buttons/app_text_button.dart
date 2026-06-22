import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Buttons';

@UseCase(name: 'Default', type: AppTextButton, path: _path)
Widget textButtonDefault(BuildContext context) {
  return boxed(AppTextButton(label: '¿Olvidaste tu contraseña?', onPressed: () {}));
}

@UseCase(name: 'Disabled', type: AppTextButton, path: _path)
Widget textButtonDisabled(BuildContext context) {
  return boxed(const AppTextButton(label: '¿Olvidaste tu contraseña?'));
}

@UseCase(name: 'Playground', type: AppTextButton, path: _path)
Widget textButtonPlayground(BuildContext context) {
  final bool enabled =
      context.knobs.boolean(label: 'Enabled', initialValue: true);
  return boxed(
    AppTextButton(
      label: context.knobs.string(label: 'Label', initialValue: 'Saber más'),
      onPressed: enabled ? () {} : null,
    ),
  );
}
