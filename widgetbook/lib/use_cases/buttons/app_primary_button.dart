import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Buttons';

@UseCase(name: 'Default', type: AppPrimaryButton, path: _path)
Widget primaryButtonDefault(BuildContext context) {
  return boxed(AppPrimaryButton(label: 'Continuar', onPressed: () {}));
}

@UseCase(name: 'Leading icon', type: AppPrimaryButton, path: _path)
Widget primaryButtonLeadingIcon(BuildContext context) {
  return boxed(
    AppPrimaryButton(
      label: 'Continuar con email',
      icon: Icons.mail_outline,
      onPressed: () {},
    ),
  );
}

@UseCase(name: 'Trailing icon', type: AppPrimaryButton, path: _path)
Widget primaryButtonTrailingIcon(BuildContext context) {
  return boxed(
    AppPrimaryButton(
      label: 'Siguiente',
      trailingIcon: Icons.arrow_forward_rounded,
      onPressed: () {},
    ),
  );
}

@UseCase(name: 'Loading', type: AppPrimaryButton, path: _path)
Widget primaryButtonLoading(BuildContext context) {
  return boxed(
    const AppPrimaryButton(label: 'Continuar', isLoading: true),
  );
}

@UseCase(name: 'Expanded', type: AppPrimaryButton, path: _path)
Widget primaryButtonExpanded(BuildContext context) {
  return boxed(
    AppPrimaryButton(label: 'Crear cuenta', expanded: true, onPressed: () {}),
  );
}

@UseCase(name: 'Disabled', type: AppPrimaryButton, path: _path)
Widget primaryButtonDisabled(BuildContext context) {
  return boxed(const AppPrimaryButton(label: 'Continuar'));
}

@UseCase(name: 'Playground', type: AppPrimaryButton, path: _path)
Widget primaryButtonPlayground(BuildContext context) {
  final bool enabled =
      context.knobs.boolean(label: 'Enabled', initialValue: true);
  return boxed(
    AppPrimaryButton(
      label: context.knobs.string(label: 'Label', initialValue: 'Continuar'),
      expanded: context.knobs.boolean(label: 'Expanded'),
      isLoading: context.knobs.boolean(label: 'Loading'),
      icon: iconKnobOrNull(context, label: 'leading icon'),
      trailingIcon: iconKnobOrNull(context, label: 'trailing icon'),
      onPressed: enabled ? () {} : null,
    ),
  );
}
