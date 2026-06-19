import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Cards';

Widget _sampleContent(BuildContext context) {
  final TextTheme text = Theme.of(context).textTheme;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Departamento céntrico', style: text.titleMedium),
      const SizedBox(height: AppSpacing.xs),
      Text(
        'Amplio, amoblado y a 5 minutos de la universidad.',
        style: text.bodyMedium,
      ),
    ],
  );
}

@UseCase(name: 'Default', type: AppCard, path: _path)
Widget cardDefault(BuildContext context) {
  return boxed(AppCard(child: _sampleContent(context)));
}

@UseCase(name: 'Bordered', type: AppCard, path: _path)
Widget cardBordered(BuildContext context) {
  return boxed(AppCard(bordered: true, child: _sampleContent(context)));
}

@UseCase(name: 'With shadow', type: AppCard, path: _path)
Widget cardWithShadow(BuildContext context) {
  return boxed(
    AppCard(shadows: AppElevation.level2, child: _sampleContent(context)),
  );
}

@UseCase(name: 'Tappable', type: AppCard, path: _path)
Widget cardTappable(BuildContext context) {
  return boxed(
    AppCard(onTap: () {}, child: _sampleContent(context)),
  );
}

@UseCase(name: 'Playground', type: AppCard, path: _path)
Widget cardPlayground(BuildContext context) {
  final bool tappable = context.knobs.boolean(label: 'Tappable');
  final bool customColor =
      context.knobs.boolean(label: 'Custom background color');
  return boxed(
    AppCard(
      bordered: context.knobs.boolean(label: 'Bordered'),
      color: customColor
          ? context.knobs.color(
              label: 'Color',
              initialValue: Theme.of(context).colorScheme.secondaryContainer,
            )
          : null,
      shadows: context.knobs.boolean(label: 'Shadow') ? AppElevation.level2 : null,
      onTap: tappable ? () {} : null,
      child: _sampleContent(context),
    ),
  );
}
