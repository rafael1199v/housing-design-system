import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Inputs';

List<Widget> _fields() => const [
      AppTextField(label: 'Nombre', hintText: 'Juan'),
      AppTextField(label: 'Apellido', hintText: 'Pérez'),
      AppTextField(label: 'Correo', hintText: 'juan@correo.com'),
      AppTextField(label: 'Teléfono', hintText: '700 00 000'),
    ];

@UseCase(name: 'Single column', type: AppFormSection, path: _path)
Widget formSectionSingle(BuildContext context) {
  return boxed(
    AppFormSection(twoColumnsWhenWide: false, children: _fields()),
    maxWidth: 720,
  );
}

@UseCase(name: 'Two columns (resize to tablet)', type: AppFormSection, path: _path)
Widget formSectionTwoColumns(BuildContext context) {
  return boxed(
    AppFormSection(children: _fields()),
    maxWidth: 820,
  );
}

@UseCase(name: 'With actions', type: AppFormSection, path: _path)
Widget formSectionWithActions(BuildContext context) {
  return boxed(
    AppFormSection(
      actions: AppPrimaryButton(
        label: 'Guardar',
        expanded: true,
        onPressed: () {},
      ),
      children: _fields(),
    ),
    maxWidth: 720,
  );
}

@UseCase(name: 'Playground', type: AppFormSection, path: _path)
Widget formSectionPlayground(BuildContext context) {
  return boxed(
    AppFormSection(
      twoColumnsWhenWide:
          context.knobs.boolean(label: 'Two columns when wide', initialValue: true),
      actions: context.knobs.boolean(label: 'Show actions', initialValue: true)
          ? AppPrimaryButton(label: 'Guardar', expanded: true, onPressed: () {})
          : null,
      children: _fields(),
    ),
    maxWidth: 820,
  );
}
