import 'package:flutter/material.dart';

import '../../tokens/app_radii.dart';
import '../../tokens/app_spacing.dart';

class AppChatBubble extends StatelessWidget {
  const AppChatBubble({
    super.key,
    required this.message,
    required this.isMine,
    this.timeLabel,
    this.pending = false,
  });

  final String message;
  final bool isMine;
  final String? timeLabel;
  final bool pending;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final Color bg = isMine ? cs.primary : cs.surfaceContainerHigh;
    final Color fg = isMine ? cs.onPrimary : cs.onSurface;

    final radius = BorderRadius.only(
      topLeft: const Radius.circular(AppRadii.lgValue),
      topRight: const Radius.circular(AppRadii.lgValue),
      bottomLeft: Radius.circular(isMine ? AppRadii.lgValue : AppRadii.xsValue),
      bottomRight: Radius.circular(isMine ? AppRadii.xsValue : AppRadii.lgValue),
    );

    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Opacity(
        opacity: pending ? 0.6 : 1,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.78,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(color: bg, borderRadius: radius),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message,
                  style: theme.textTheme.bodyMedium?.copyWith(color: fg),
                ),
                if (timeLabel != null) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (pending) ...[
                        Icon(
                          Icons.schedule,
                          size: 11,
                          color: fg.withValues(alpha: 0.7),
                        ),
                        const SizedBox(width: AppSpacing.xs),
                      ],
                      Text(
                        timeLabel!,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: fg.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
