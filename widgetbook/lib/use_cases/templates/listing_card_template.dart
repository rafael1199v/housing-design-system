import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/sample_data.dart';
import '../../helpers/wrappers.dart';

const String _path = '[Patterns]';

class _Listing {
  const _Listing(this.title, this.location, this.price, this.badge, this.tags);
  final String title;
  final String location;
  final String price;
  final String? badge;
  final List<(IconData, String)> tags;
}

const List<_Listing> _listings = [
  _Listing(
    'Departamento amoblado',
    'Cala Cala, Cochabamba',
    'Bs 2.500 / mes',
    'NUEVO',
    [(Icons.bed_outlined, '2 dorm.'), (Icons.wifi_rounded, 'Wifi'), (Icons.garage_outlined, 'Garaje')],
  ),
  _Listing(
    'Habitación para estudiante',
    'Sarco, Cochabamba',
    'Bs 900 / mes',
    null,
    [(Icons.bed_outlined, '1 dorm.'), (Icons.chair_outlined, 'Amoblado')],
  ),
];

class ListingCardTemplate extends StatelessWidget {
  const ListingCardTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    final AppSemanticColors sem = semanticsOf(context);
    final TextTheme text = Theme.of(context).textTheme;

    return AppScaffold(
      appBar: AppBar(title: const Text('Explorar')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: _listings.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.lg),
            itemBuilder: (context, i) {
              final _Listing l = _listings[i];
              return AppImageCard(
                image: sampleRoomImage,
                onTap: () {},
                overlay: l.badge == null
                    ? null
                    : AppStatusBadge(
                        label: l.badge!,
                        foregroundColor: sem.onAccent,
                        backgroundColor: sem.accent,
                      ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(l.title, style: text.titleMedium),
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Text(l.location, style: text.bodySmall),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.sm,
                      children: [
                        for (final (IconData icon, String label) in l.tags)
                          AppChip(label: label, icon: icon),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(l.price, style: text.titleSmall),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

@UseCase(name: 'Listing cards', type: ListingCardTemplate, path: _path)
Widget listingCardTemplate(BuildContext context) {
  return const ListingCardTemplate();
}
