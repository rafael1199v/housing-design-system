import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Inputs';

const List<String> _months = [
  'ene', 'feb', 'mar', 'abr', 'may', 'jun',
  'jul', 'ago', 'sep', 'oct', 'nov', 'dic',
];

String _spanishFormat(DateTime d) => '${d.day} ${_months[d.month - 1]} ${d.year}';

Widget _dateField({
  DateTime? initial,
  String? label,
  String? error,
  bool enabled = true,
  bool uppercaseLabel = false,
  String Function(DateTime)? format,
}) {
  DateTime? value = initial;
  return StatefulBuilder(
    builder: (context, setState) => AppDateField(
      value: value,
      label: label,
      hintText: 'Selecciona una fecha',
      errorText: error,
      enabled: enabled,
      uppercaseLabel: uppercaseLabel,
      formatLabel: format,
      onChanged: (d) => setState(() => value = d),
    ),
  );
}

@UseCase(name: 'Empty', type: AppDateField, path: _path)
Widget dateFieldEmpty(BuildContext context) {
  return boxed(_dateField(label: 'Fecha de nacimiento'));
}

@UseCase(name: 'With date', type: AppDateField, path: _path)
Widget dateFieldWithDate(BuildContext context) {
  return boxed(
    _dateField(label: 'Fecha de nacimiento', initial: DateTime(2002, 5, 14)),
  );
}

@UseCase(name: 'Custom format', type: AppDateField, path: _path)
Widget dateFieldCustomFormat(BuildContext context) {
  return boxed(
    _dateField(
      label: 'Fecha de ingreso',
      initial: DateTime(2025, 3, 1),
      format: _spanishFormat,
    ),
  );
}

@UseCase(name: 'Error', type: AppDateField, path: _path)
Widget dateFieldError(BuildContext context) {
  return boxed(
    _dateField(label: 'Fecha', error: 'Selecciona una fecha válida'),
  );
}

@UseCase(name: 'Disabled', type: AppDateField, path: _path)
Widget dateFieldDisabled(BuildContext context) {
  return boxed(
    _dateField(label: 'Fecha', initial: DateTime(2000, 1, 1), enabled: false),
  );
}

@UseCase(name: 'Playground', type: AppDateField, path: _path)
Widget dateFieldPlayground(BuildContext context) {
  final bool spanishFormat = context.knobs.boolean(label: 'Spanish format');
  return boxed(
    _dateField(
      label: context.knobs.string(label: 'Label', initialValue: 'Fecha'),
      enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
      uppercaseLabel: context.knobs.boolean(label: 'Uppercase label'),
      error: context.knobs.stringOrNull(label: 'Error text', defaultToNull: true),
      format: spanishFormat ? _spanishFormat : null,
    ),
  );
}
