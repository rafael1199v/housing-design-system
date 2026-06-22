import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Inputs';

Widget _toggle(List<String> labels, {int initialIndex = 0}) {
  int index = initialIndex;
  return StatefulBuilder(
    builder: (context, setState) => AppSegmentedToggle(
      labels: labels,
      selectedIndex: index,
      onChanged: (i) => setState(() => index = i),
    ),
  );
}

@UseCase(name: 'Two segments', type: AppSegmentedToggle, path: _path)
Widget segmentedTwo(BuildContext context) {
  return boxed(_toggle(const ['Estudiante', 'Propietario']));
}

@UseCase(name: 'Three segments', type: AppSegmentedToggle, path: _path)
Widget segmentedThree(BuildContext context) {
  return boxed(_toggle(const ['Día', 'Semana', 'Mes'], initialIndex: 1));
}

@UseCase(name: 'Playground', type: AppSegmentedToggle, path: _path)
Widget segmentedPlayground(BuildContext context) {
  final int count = context.knobs.int.slider(
    label: 'Segments',
    initialValue: 2,
    min: 2,
    max: 4,
  );
  const List<String> pool = ['Uno', 'Dos', 'Tres', 'Cuatro'];
  return boxed(_toggle(pool.take(count).toList()));
}
