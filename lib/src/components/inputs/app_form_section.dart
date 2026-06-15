import 'package:flutter/material.dart';

import '../../responsive/breakpoints.dart';
import '../../tokens/app_spacing.dart';

class AppFormSection extends StatelessWidget {
  const AppFormSection({
    super.key,
    required this.children,
    this.actions,
    this.twoColumnsWhenWide = true,
  });

  final List<Widget> children;
  final Widget? actions;
  final bool twoColumnsWhenWide;

  @override
  Widget build(BuildContext context) {
    final bool twoColumns =
        twoColumnsWhenWide && Breakpoints.isExpanded(context);

    final Widget fields =
        twoColumns ? _buildTwoColumns() : _buildSingleColumn();

    if (actions == null) return fields;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        fields,
        const SizedBox(height: AppSpacing.xxl),
        actions!,
      ],
    );
  }

  Widget _buildSingleColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) const SizedBox(height: AppSpacing.lg),
          children[i],
        ],
      ],
    );
  }

  Widget _buildTwoColumns() {
    final List<Widget> rows = [];
    for (var i = 0; i < children.length; i += 2) {
      final bool hasSecond = i + 1 < children.length;
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: children[i]),
            const SizedBox(width: AppSpacing.lg),
            if (hasSecond)
              Expanded(child: children[i + 1])
            else
              const Expanded(child: SizedBox.shrink()),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < rows.length; i++) ...[
          if (i > 0) const SizedBox(height: AppSpacing.lg),
          rows[i],
        ],
      ],
    );
  }
}
