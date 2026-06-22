import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Buttons';

@UseCase(name: 'Default', type: AppGoogleButton, path: _path)
Widget googleButtonDefault(BuildContext context) {
  return boxed(
    AppGoogleButton(label: 'Continuar con Google', onPressed: () {}),
  );
}

@UseCase(name: 'Playground', type: AppGoogleButton, path: _path)
Widget googleButtonPlayground(BuildContext context) {
  return boxed(
    AppGoogleButton(
      label: context.knobs.string(
        label: 'Label',
        initialValue: 'Continuar con Google',
      ),
      onPressed: () {},
    ),
  );
}
