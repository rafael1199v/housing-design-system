import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/sample_data.dart';

const String _path = '[Patterns]';

class RegisterFormTemplate extends StatefulWidget {
  const RegisterFormTemplate({super.key});

  @override
  State<RegisterFormTemplate> createState() => _RegisterFormTemplateState();
}

class _RegisterFormTemplateState extends State<RegisterFormTemplate> {
  int _role = 0; // 0 = Estudiante, 1 = Propietario
  String? _city;
  DateTime? _birthDate;
  int _propertyType = 0;

  bool get _isOwner => _role == 1;

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).textTheme;

    return AppScaffold(
      appBar: AppBar(title: const Text('Crear cuenta')),
      padded: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Tipo de cuenta', style: text.titleSmall),
            const SizedBox(height: AppSpacing.sm),
            AppSegmentedToggle(
              labels: const ['Estudiante', 'Propietario'],
              selectedIndex: _role,
              onChanged: (i) => setState(() => _role = i),
            ),
            const SizedBox(height: AppSpacing.xl),
            AppFormSection(
              children: const [
                AppTextField(label: 'Nombre', hintText: 'Juan'),
                AppTextField(label: 'Apellido', hintText: 'Pérez'),
                AppTextField(
                  label: 'Correo',
                  hintText: 'juan@correo.com',
                  prefixIcon: Icons.mail_outline,
                ),
                AppTextField(
                  label: 'Teléfono',
                  hintText: '700 00 000',
                  prefixIcon: Icons.phone_outlined,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            AppDateField(
              label: 'Fecha de nacimiento',
              value: _birthDate,
              onChanged: (d) => setState(() => _birthDate = d),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppDropdownField<String>(
              label: 'Ciudad',
              items: sampleCityItems,
              value: _city,
              hintText: 'Selecciona una ciudad',
              prefixIcon: Icons.location_city_outlined,
              onChanged: (v) => setState(() => _city = v),
            ),
            if (_isOwner) ...[
              const SizedBox(height: AppSpacing.lg),
              const AppFieldLabel(text: 'Tipo de propiedad'),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Expanded(
                    child: AppSelectableOption(
                      label: 'Casa',
                      icon: Icons.house_outlined,
                      selected: _propertyType == 0,
                      onTap: () => setState(() => _propertyType = 0),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: AppSelectableOption(
                      label: 'Departamento',
                      icon: Icons.apartment_rounded,
                      selected: _propertyType == 1,
                      onTap: () => setState(() => _propertyType = 1),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: AppSpacing.xxl),
            AppPrimaryButton(
              label: 'Crear cuenta',
              expanded: true,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

@UseCase(name: 'Register form', type: RegisterFormTemplate, path: _path)
Widget registerFormTemplate(BuildContext context) {
  return const RegisterFormTemplate();
}
