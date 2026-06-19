import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/sample_data.dart';
import '../../helpers/wrappers.dart';

const String _path = '[Components]/Cards';

Widget _listingContent(BuildContext context) {
  final TextTheme text = Theme.of(context).textTheme;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Departamento amoblado', style: text.titleMedium),
      const SizedBox(height: AppSpacing.xs),
      Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 16,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: AppSpacing.xs),
          Text('Cala Cala, Cochabamba', style: text.bodySmall),
        ],
      ),
      const SizedBox(height: AppSpacing.sm),
      Text('Bs 2.500 / mes', style: text.titleSmall),
    ],
  );
}

@UseCase(name: 'Image + content', type: AppImageCard, path: _path)
Widget imageCardFull(BuildContext context) {
  return boxed(
    AppImageCard(image: sampleRoomImage, content: _listingContent(context)),
    maxWidth: 320,
  );
}

@UseCase(name: 'With overlay badge', type: AppImageCard, path: _path)
Widget imageCardOverlay(BuildContext context) {
  return boxed(
    AppImageCard(
      image: sampleRoomImage,
      overlay: const AppStatusBadge(label: 'NUEVO'),
      content: _listingContent(context),
    ),
    maxWidth: 320,
  );
}

@UseCase(name: 'Placeholder (no image)', type: AppImageCard, path: _path)
Widget imageCardPlaceholder(BuildContext context) {
  return boxed(
    AppImageCard(content: _listingContent(context)),
    maxWidth: 320,
  );
}

@UseCase(name: 'Tappable', type: AppImageCard, path: _path)
Widget imageCardTappable(BuildContext context) {
  return boxed(
    AppImageCard(
      image: sampleRoomImage,
      onTap: () {},
      content: _listingContent(context),
    ),
    maxWidth: 320,
  );
}

@UseCase(name: 'Playground', type: AppImageCard, path: _path)
Widget imageCardPlayground(BuildContext context) {
  return boxed(
    AppImageCard(
      image: context.knobs.boolean(label: 'Show image', initialValue: true)
          ? sampleRoomImage
          : null,
      imageHeight: context.knobs.double.slider(
        label: 'Image height',
        initialValue: 180,
        min: 100,
        max: 280,
      ),
      overlay: context.knobs.boolean(label: 'Overlay badge')
          ? const AppStatusBadge(label: 'NUEVO')
          : null,
      content: context.knobs.boolean(label: 'Show content', initialValue: true)
          ? _listingContent(context)
          : null,
      onTap: context.knobs.boolean(label: 'Tappable') ? () {} : null,
    ),
    maxWidth: 320,
  );
}
