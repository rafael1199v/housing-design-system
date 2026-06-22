import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Inputs';

@UseCase(name: 'Lowercase', type: AppFieldLabel, path: _path)
Widget fieldLabelLowercase(BuildContext context) {
  return boxed(const AppFieldLabel(text: 'Nombre completo'));
}

@UseCase(name: 'Uppercase', type: AppFieldLabel, path: _path)
Widget fieldLabelUppercase(BuildContext context) {
  return boxed(const AppFieldLabel(text: 'Nombre completo', uppercase: true));
}

@UseCase(name: 'With trailing', type: AppFieldLabel, path: _path)
Widget fieldLabelTrailing(BuildContext context) {
  return boxed(
    AppFieldLabel(
      text: 'Teléfono',
      trailing: Text(
        'Opcional',
        style: Theme.of(context).textTheme.labelSmall,
      ),
    ),
  );
}

@UseCase(name: 'Playground', type: AppFieldLabel, path: _path)
Widget fieldLabelPlayground(BuildContext context) {
  return boxed(
    AppFieldLabel(
      text: context.knobs.string(label: 'Text', initialValue: 'Nombre completo'),
      uppercase: context.knobs.boolean(label: 'Uppercase'),
      trailing: context.knobs.boolean(label: 'Trailing widget')
          ? Text('Opcional', style: Theme.of(context).textTheme.labelSmall)
          : null,
    ),
  );
}
