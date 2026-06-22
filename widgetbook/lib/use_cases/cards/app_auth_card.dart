import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const String _path = '[Components]/Cards';

Widget _authContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisSize: MainAxisSize.min,
    children: [
      const Center(child: AppBrandLogo()),
      const SizedBox(height: AppSpacing.xxl),
      const AppTextField(label: 'Correo', hintText: 'tu@correo.com'),
      const SizedBox(height: AppSpacing.lg),
      const AppTextField(
        label: 'Contraseña',
        hintText: '••••••••',
        obscureText: true,
      ),
      const SizedBox(height: AppSpacing.xl),
      AppPrimaryButton(label: 'Ingresar', expanded: true, onPressed: () {}),
    ],
  );
}

@UseCase(name: 'Default', type: AppAuthCard, path: _path)
Widget authCardDefault(BuildContext context) {
  return AppAuthCard(child: _authContent());
}

@UseCase(name: 'Playground', type: AppAuthCard, path: _path)
Widget authCardPlayground(BuildContext context) {
  return AppAuthCard(
    maxWidth: context.knobs.double.slider(
      label: 'Max width',
      initialValue: 440,
      min: 280,
      max: 720,
    ),
    child: _authContent(),
  );
}
