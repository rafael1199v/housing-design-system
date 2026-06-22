import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/controller_host.dart';
import '../../helpers/wrappers.dart';

const String _path = '[Components]/Inputs';

@UseCase(name: 'Default', type: AppTextField, path: _path)
Widget textFieldDefault(BuildContext context) {
  return boxed(const AppTextField(label: 'Nombre', hintText: 'Tu nombre'));
}

@UseCase(name: 'Without label', type: AppTextField, path: _path)
Widget textFieldNoLabel(BuildContext context) {
  return boxed(const AppTextField(hintText: 'Escribe aquí…'));
}

@UseCase(name: 'Password', type: AppTextField, path: _path)
Widget textFieldPassword(BuildContext context) {
  return boxed(
    const AppTextField(
      label: 'Contraseña',
      hintText: '••••••••',
      obscureText: true,
      prefixIcon: Icons.lock_outline,
    ),
  );
}

@UseCase(name: 'Prefix icon', type: AppTextField, path: _path)
Widget textFieldPrefix(BuildContext context) {
  return boxed(
    const AppTextField(
      label: 'Correo',
      hintText: 'tu@correo.com',
      prefixIcon: Icons.mail_outline,
    ),
  );
}

@UseCase(name: 'Suffix widget', type: AppTextField, path: _path)
Widget textFieldSuffix(BuildContext context) {
  return boxed(
    AppTextField(
      label: 'Contraseña',
      hintText: '••••••••',
      obscureText: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.visibility_outlined),
        onPressed: () {},
      ),
    ),
  );
}

@UseCase(name: 'Error', type: AppTextField, path: _path)
Widget textFieldError(BuildContext context) {
  return boxed(
    ControllerHost(
      initialText: 'correo-invalido',
      builder: (context, controller) => AppTextField(
        label: 'Correo',
        controller: controller,
        errorText: 'Ingresa un correo válido',
      ),
    ),
  );
}

@UseCase(name: 'Disabled', type: AppTextField, path: _path)
Widget textFieldDisabled(BuildContext context) {
  return boxed(
    ControllerHost(
      initialText: 'No editable',
      builder: (context, controller) => AppTextField(
        label: 'Usuario',
        controller: controller,
        enabled: false,
      ),
    ),
  );
}

@UseCase(name: 'Multiline', type: AppTextField, path: _path)
Widget textFieldMultiline(BuildContext context) {
  return boxed(
    const AppTextField(
      label: 'Descripción',
      hintText: 'Describe la propiedad…',
      maxLines: 4,
    ),
  );
}

@UseCase(name: 'Uppercase label + trailing', type: AppTextField, path: _path)
Widget textFieldUppercaseTrailing(BuildContext context) {
  return boxed(
    AppTextField(
      label: 'Teléfono',
      hintText: '700 00 000',
      uppercaseLabel: true,
      keyboardType: TextInputType.phone,
      prefixIcon: Icons.phone_outlined,
      labelTrailing: Text(
        'Opcional',
        style: Theme.of(context).textTheme.labelSmall,
      ),
    ),
  );
}

@UseCase(name: 'Playground', type: AppTextField, path: _path)
Widget textFieldPlayground(BuildContext context) {
  final bool showLabel =
      context.knobs.boolean(label: 'Show label', initialValue: true);
  final bool numeric = context.knobs.boolean(label: 'Numbers only');
  return boxed(
    AppTextField(
      label: showLabel
          ? context.knobs.string(label: 'Label', initialValue: 'Nombre')
          : null,
      hintText: context.knobs.string(label: 'Hint', initialValue: 'Tu nombre'),
      obscureText: context.knobs.boolean(label: 'Obscure (password)'),
      enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
      uppercaseLabel: context.knobs.boolean(label: 'Uppercase label'),
      maxLines: context.knobs.int.slider(
        label: 'Max lines',
        initialValue: 1,
        min: 1,
        max: 6,
      ),
      prefixIcon: iconKnobOrNull(context, label: 'prefix icon'),
      errorText: context.knobs.stringOrNull(
        label: 'Error text',
        initialValue: null,
        defaultToNull: true,
      ),
      inputFormatters:
          numeric ? [FilteringTextInputFormatter.digitsOnly] : null,
    ),
  );
}
