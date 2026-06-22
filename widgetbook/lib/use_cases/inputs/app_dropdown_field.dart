import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/sample_data.dart';
import '../../helpers/wrappers.dart';

const String _path = '[Components]/Inputs';

Widget _dropdown({
  String? initial,
  String? label,
  String? hint,
  IconData? icon,
  String? error,
  bool enabled = true,
  bool uppercaseLabel = false,
}) {
  String? value = initial;
  return StatefulBuilder(
    builder: (context, setState) => AppDropdownField<String>(
      items: sampleCityItems,
      value: value,
      label: label,
      hintText: hint ?? 'Selecciona una ciudad',
      prefixIcon: icon,
      errorText: error,
      enabled: enabled,
      uppercaseLabel: uppercaseLabel,
      onChanged: (v) => setState(() => value = v),
    ),
  );
}

@UseCase(name: 'Empty (hint)', type: AppDropdownField, path: _path)
Widget dropdownEmpty(BuildContext context) {
  return boxed(_dropdown(label: 'Ciudad'));
}

@UseCase(name: 'Selected', type: AppDropdownField, path: _path)
Widget dropdownSelected(BuildContext context) {
  return boxed(_dropdown(label: 'Ciudad', initial: 'cbba'));
}

@UseCase(name: 'Label + icon', type: AppDropdownField, path: _path)
Widget dropdownLabelIcon(BuildContext context) {
  return boxed(
    _dropdown(label: 'Ciudad', icon: Icons.location_city_outlined),
  );
}

@UseCase(name: 'Error', type: AppDropdownField, path: _path)
Widget dropdownError(BuildContext context) {
  return boxed(
    _dropdown(label: 'Ciudad', error: 'Selecciona una ciudad'),
  );
}

@UseCase(name: 'Disabled', type: AppDropdownField, path: _path)
Widget dropdownDisabled(BuildContext context) {
  return boxed(
    _dropdown(label: 'Ciudad', initial: 'lpz', enabled: false),
  );
}

@UseCase(name: 'Playground', type: AppDropdownField, path: _path)
Widget dropdownPlayground(BuildContext context) {
  final bool showLabel =
      context.knobs.boolean(label: 'Show label', initialValue: true);
  return boxed(
    _dropdown(
      label: showLabel
          ? context.knobs.string(label: 'Label', initialValue: 'Ciudad')
          : null,
      hint: context.knobs.string(
        label: 'Hint',
        initialValue: 'Selecciona una ciudad',
      ),
      icon: iconKnobOrNull(context, label: 'prefix icon'),
      error: context.knobs.stringOrNull(
        label: 'Error text',
        defaultToNull: true,
      ),
      enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
      uppercaseLabel: context.knobs.boolean(label: 'Uppercase label'),
    ),
  );
}
