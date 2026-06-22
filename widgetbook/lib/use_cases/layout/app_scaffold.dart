import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/sample_data.dart';

const String _path = '[Components]/Layout';

Widget _body(BuildContext context) {
  return ListView(
    padding: const EdgeInsets.all(AppSpacing.lg),
    children: [
      AppSectionHeader(title: 'Destacados', actionLabel: 'Ver todo', onActionPressed: () {}),
      const SizedBox(height: AppSpacing.md),
      AppCard(
        child: Text(
          'Contenido de ejemplo dentro del AppScaffold.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      const SizedBox(height: AppSpacing.md),
      const AppCard(child: Text('Otra tarjeta de contenido.')),
    ],
  );
}

PreferredSizeWidget _appBar() => AppBar(title: const Text('Inicio'));

Widget _bottomNav() => AppBottomNavBar(
      destinations: sampleNavDestinations,
      selectedIndex: 0,
      onDestinationSelected: (_) {},
    );

@UseCase(name: 'App bar + body', type: AppScaffold, path: _path)
Widget scaffoldBasic(BuildContext context) {
  return AppScaffold(appBar: _appBar(), body: _body(context));
}

@UseCase(name: 'With bottom nav', type: AppScaffold, path: _path)
Widget scaffoldBottomNav(BuildContext context) {
  return AppScaffold(
    appBar: _appBar(),
    bottomNavigationBar: _bottomNav(),
    body: _body(context),
  );
}

@UseCase(name: 'With FAB', type: AppScaffold, path: _path)
Widget scaffoldFab(BuildContext context) {
  return AppScaffold(
    appBar: _appBar(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    ),
    body: _body(context),
  );
}

@UseCase(name: 'Padded', type: AppScaffold, path: _path)
Widget scaffoldPadded(BuildContext context) {
  return AppScaffold(
    appBar: _appBar(),
    padded: true,
    body: Center(
      child: Text(
        'padded: true aplica AppSpacing.screenPadding',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    ),
  );
}

@UseCase(name: 'Playground', type: AppScaffold, path: _path)
Widget scaffoldPlayground(BuildContext context) {
  final bool withNav =
      context.knobs.boolean(label: 'Bottom nav', initialValue: true);
  return AppScaffold(
    appBar: context.knobs.boolean(label: 'App bar', initialValue: true)
        ? _appBar()
        : null,
    bottomNavigationBar: withNav ? _bottomNav() : null,
    floatingActionButton: context.knobs.boolean(label: 'FAB')
        ? FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add))
        : null,
    padded: context.knobs.boolean(label: 'Padded'),
    extendBody: context.knobs.boolean(label: 'Extend body behind nav'),
    body: _body(context),
  );
}
