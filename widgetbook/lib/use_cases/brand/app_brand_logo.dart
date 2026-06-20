import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Brand';

@UseCase(name: 'Default', type: AppBrandLogo, path: _path)
Widget brandLogoDefault(BuildContext context) {
  return boxed(const AppBrandLogo());
}

@UseCase(name: 'Playground', type: AppBrandLogo, path: _path)
Widget brandLogoPlayground(BuildContext context) {
  return boxed(
    AppBrandLogo(
      brandName: context.knobs.string(
        label: 'Brand name',
        initialValue: 'Housing',
      ),
      icon: iconKnob(context, initial: Icons.shield_outlined),
    ),
  );
}
