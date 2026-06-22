import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Layout';

@UseCase(name: 'With action', type: AppSectionHeader, path: _path)
Widget sectionHeaderWithAction(BuildContext context) {
  return boxed(
    AppSectionHeader(
      title: 'Destacados',
      actionLabel: 'Ver todo',
      onActionPressed: () {},
    ),
    maxWidth: 480,
  );
}

@UseCase(name: 'Without action', type: AppSectionHeader, path: _path)
Widget sectionHeaderNoAction(BuildContext context) {
  return boxed(
    const AppSectionHeader(title: 'Mensajes recientes'),
    maxWidth: 480,
  );
}

@UseCase(name: 'Long title', type: AppSectionHeader, path: _path)
Widget sectionHeaderLongTitle(BuildContext context) {
  return boxed(
    AppSectionHeader(
      title: 'Propiedades destacadas cerca de la universidad principal',
      actionLabel: 'Ver todo',
      onActionPressed: () {},
    ),
    maxWidth: 420,
  );
}

@UseCase(name: 'Playground', type: AppSectionHeader, path: _path)
Widget sectionHeaderPlayground(BuildContext context) {
  final bool hasAction =
      context.knobs.boolean(label: 'Show action', initialValue: true);
  return boxed(
    AppSectionHeader(
      title: context.knobs.string(label: 'Title', initialValue: 'Destacados'),
      actionLabel: hasAction
          ? context.knobs.string(label: 'Action label', initialValue: 'Ver todo')
          : null,
      onActionPressed: hasAction ? () {} : null,
    ),
    maxWidth: 480,
  );
}
