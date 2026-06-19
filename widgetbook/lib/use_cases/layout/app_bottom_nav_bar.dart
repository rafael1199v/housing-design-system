import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/sample_data.dart';

const String _path = '[Components]/Layout';

Widget _navBar(List<AppBottomNavDestination> destinations, {int initial = 0}) {
  int index = initial;
  return Center(
    child: SizedBox(
      width: 420,
      child: StatefulBuilder(
        builder: (context, setState) => AppBottomNavBar(
          destinations: destinations,
          selectedIndex: index,
          onDestinationSelected: (i) => setState(() => index = i),
        ),
      ),
    ),
  );
}

@UseCase(name: 'Four destinations', type: AppBottomNavBar, path: _path)
Widget bottomNavFour(BuildContext context) {
  return _navBar(sampleNavDestinations);
}

@UseCase(name: 'Three destinations', type: AppBottomNavBar, path: _path)
Widget bottomNavThree(BuildContext context) {
  return _navBar(sampleNavDestinations.take(3).toList());
}

@UseCase(name: 'Last selected', type: AppBottomNavBar, path: _path)
Widget bottomNavLastSelected(BuildContext context) {
  return _navBar(sampleNavDestinations, initial: 3);
}

@UseCase(name: 'Playground', type: AppBottomNavBar, path: _path)
Widget bottomNavPlayground(BuildContext context) {
  final int count = context.knobs.int.slider(
    label: 'Destinations',
    initialValue: 4,
    min: 2,
    max: 4,
  );
  final int selected = context.knobs.int.slider(
    label: 'Selected index',
    initialValue: 0,
    max: count - 1,
  );
  return _navBar(sampleNavDestinations.take(count).toList(), initial: selected);
}
