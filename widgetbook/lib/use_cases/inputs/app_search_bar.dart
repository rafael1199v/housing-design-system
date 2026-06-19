import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/controller_host.dart';
import '../../helpers/wrappers.dart';

const String _path = '[Components]/Inputs';

@UseCase(name: 'Empty', type: AppSearchBar, path: _path)
Widget searchBarEmpty(BuildContext context) {
  return boxed(const AppSearchBar(hintText: 'Buscar propiedades…'));
}

@UseCase(name: 'With value', type: AppSearchBar, path: _path)
Widget searchBarWithValue(BuildContext context) {
  return boxed(
    ControllerHost(
      initialText: 'Cochabamba',
      builder: (context, controller) => AppSearchBar(
        controller: controller,
        trailing: IconButton(
          icon: const Icon(Icons.close),
          onPressed: controller.clear,
        ),
      ),
    ),
  );
}

@UseCase(name: 'Read-only', type: AppSearchBar, path: _path)
Widget searchBarReadOnly(BuildContext context) {
  return boxed(
    AppSearchBar(
      hintText: 'Toca para buscar',
      readOnly: true,
      onTap: () {},
    ),
  );
}

@UseCase(name: 'With trailing', type: AppSearchBar, path: _path)
Widget searchBarTrailing(BuildContext context) {
  return boxed(
    AppSearchBar(
      hintText: 'Buscar…',
      trailing: IconButton(
        icon: const Icon(Icons.tune_rounded),
        onPressed: () {},
      ),
    ),
  );
}

@UseCase(name: 'Playground', type: AppSearchBar, path: _path)
Widget searchBarPlayground(BuildContext context) {
  final bool showTrailing = context.knobs.boolean(label: 'Trailing filter icon');
  return boxed(
    AppSearchBar(
      hintText: context.knobs.string(label: 'Hint', initialValue: 'Buscar'),
      readOnly: context.knobs.boolean(label: 'Read-only'),
      autofocus: context.knobs.boolean(label: 'Autofocus'),
      trailing: showTrailing
          ? IconButton(icon: const Icon(Icons.tune_rounded), onPressed: () {})
          : null,
    ),
  );
}
