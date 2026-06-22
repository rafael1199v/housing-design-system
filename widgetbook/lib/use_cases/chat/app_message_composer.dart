import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/controller_host.dart';
import '../../helpers/wrappers.dart';

const String _path = '[Components]/Chat';

@UseCase(name: 'Enabled', type: AppMessageComposer, path: _path)
Widget messageComposerEnabled(BuildContext context) {
  return boxed(
    ControllerHost(
      builder: (context, controller) => AppMessageComposer(
        controller: controller,
        hintText: 'Escribe un mensaje…',
        onSend: (_) => controller.clear(),
      ),
    ),
  );
}

@UseCase(name: 'Disabled', type: AppMessageComposer, path: _path)
Widget messageComposerDisabled(BuildContext context) {
  return boxed(
    ControllerHost(
      builder: (context, controller) => AppMessageComposer(
        controller: controller,
        enabled: false,
        hintText: 'No puedes enviar mensajes',
        onSend: (_) {},
      ),
    ),
  );
}

@UseCase(name: 'Playground', type: AppMessageComposer, path: _path)
Widget messageComposerPlayground(BuildContext context) {
  final bool enabled =
      context.knobs.boolean(label: 'Enabled', initialValue: true);
  final String hint = context.knobs.string(
    label: 'Hint text',
    initialValue: 'Escribe un mensaje…',
  );
  return boxed(
    ControllerHost(
      builder: (context, controller) => AppMessageComposer(
        controller: controller,
        enabled: enabled,
        hintText: hint,
        onSend: (_) => controller.clear(),
      ),
    ),
  );
}
