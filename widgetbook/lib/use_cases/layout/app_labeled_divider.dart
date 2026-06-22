import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Layout';

@UseCase(name: 'Default', type: AppLabeledDivider, path: _path)
Widget labeledDividerDefault(BuildContext context) {
  return boxed(const AppLabeledDivider(label: 'o continúa con'));
}

@UseCase(name: 'Playground', type: AppLabeledDivider, path: _path)
Widget labeledDividerPlayground(BuildContext context) {
  return boxed(
    AppLabeledDivider(
      label: context.knobs.string(label: 'Label', initialValue: 'o continúa con'),
    ),
  );
}
