import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

Widget boxed(Widget child, {double maxWidth = 420}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    ),
  );
}

AppSemanticColors semanticsOf(BuildContext context) =>
    Theme.of(context).extension<AppSemanticColors>() ??
    AppSemanticColors.standard;

const Map<String, IconData> kIconChoices = <String, IconData>{
  'home': Icons.home_rounded,
  'search': Icons.search_rounded,
  'person': Icons.person_outline,
  'shield': Icons.shield_outlined,
  'apartment': Icons.apartment_rounded,
  'cottage': Icons.cottage_outlined,
  'check': Icons.check_rounded,
  'arrow_forward': Icons.arrow_forward_rounded,
  'mail': Icons.mail_outline,
  'lock': Icons.lock_outline,
  'phone': Icons.phone_outlined,
  'star': Icons.star_outline_rounded,
  'favorite': Icons.favorite_border,
  'location': Icons.location_on_outlined,
  'calendar': Icons.calendar_today_outlined,
};

String _iconLabel(IconData icon) => kIconChoices.entries
    .firstWhere(
      (MapEntry<String, IconData> e) => e.value == icon,
      orElse: () => const MapEntry<String, IconData>('icon', Icons.help_outline),
    )
    .key;

IconData iconKnob(
  BuildContext context, {
  String label = 'Icon',
  IconData? initial,
}) {
  return context.knobs.object.dropdown<IconData>(
    label: label,
    options: kIconChoices.values.toList(),
    initialOption: initial ?? kIconChoices.values.first,
    labelBuilder: _iconLabel,
  );
}

IconData? iconKnobOrNull(
  BuildContext context, {
  String label = 'Icon',
  IconData? initial,
  bool initiallyOn = false,
}) {
  final bool show =
      context.knobs.boolean(label: 'Show $label', initialValue: initiallyOn);
  if (!show) return null;
  return iconKnob(context, label: label, initial: initial);
}
