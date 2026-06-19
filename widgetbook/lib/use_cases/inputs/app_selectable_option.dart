import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Inputs';

@UseCase(name: 'Selected', type: AppSelectableOption, path: _path)
Widget selectableSelected(BuildContext context) {
  return boxed(
    SizedBox(
      width: 150,
      child: AppSelectableOption(
        label: 'Estudiante',
        icon: Icons.school_outlined,
        selected: true,
        onTap: () {},
      ),
    ),
    maxWidth: 180,
  );
}

@UseCase(name: 'Unselected', type: AppSelectableOption, path: _path)
Widget selectableUnselected(BuildContext context) {
  return boxed(
    SizedBox(
      width: 150,
      child: AppSelectableOption(
        label: 'Propietario',
        icon: Icons.home_work_outlined,
        selected: false,
        onTap: () {},
      ),
    ),
    maxWidth: 180,
  );
}

@UseCase(name: 'Selectable pair', type: AppSelectableOption, path: _path)
Widget selectablePair(BuildContext context) {
  int selected = 0;
  return boxed(
    StatefulBuilder(
      builder: (context, setState) => Row(
        children: [
          Expanded(
            child: AppSelectableOption(
              label: 'Estudiante',
              icon: Icons.school_outlined,
              selected: selected == 0,
              onTap: () => setState(() => selected = 0),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: AppSelectableOption(
              label: 'Propietario',
              icon: Icons.home_work_outlined,
              selected: selected == 1,
              onTap: () => setState(() => selected = 1),
            ),
          ),
        ],
      ),
    ),
    maxWidth: 360,
  );
}

@UseCase(name: 'Playground', type: AppSelectableOption, path: _path)
Widget selectablePlayground(BuildContext context) {
  return boxed(
    SizedBox(
      width: 160,
      child: AppSelectableOption(
        label: context.knobs.string(label: 'Label', initialValue: 'Estudiante'),
        icon: iconKnob(context, initial: Icons.school_outlined),
        selected: context.knobs.boolean(label: 'Selected', initialValue: true),
        onTap: () {},
      ),
    ),
    maxWidth: 200,
  );
}
