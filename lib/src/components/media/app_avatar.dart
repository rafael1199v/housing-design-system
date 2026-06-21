import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({super.key, this.image, this.name, this.radius = 24});

  final ImageProvider? image;
  final String? name;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final double diameter = radius * 2;

    final Widget placeholder = _AvatarPlaceholder(
      name: name,
      radius: radius,
      colors: colors,
    );

    return SizedBox(
      width: diameter,
      height: diameter,
      child: ClipOval(
        child: DecoratedBox(
          decoration: BoxDecoration(color: colors.surfaceContainerLow),
          child: image == null
              ? placeholder
              : Image(
                  image: image!,
                  fit: BoxFit.cover,
                  width: diameter,
                  height: diameter,
                  errorBuilder: (_, __, ___) => placeholder,
                ),
        ),
      ),
    );
  }
}

class _AvatarPlaceholder extends StatelessWidget {
  const _AvatarPlaceholder({
    required this.name,
    required this.radius,
    required this.colors,
  });

  final String? name;
  final double radius;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    final String initials = _initials(name);
    if (initials.isEmpty) {
      return Center(
        child: Icon(Icons.person_outline, size: radius, color: colors.outline),
      );
    }
    return Center(
      child: Text(
        initials,
        style: TextStyle(
          fontSize: radius * 0.8,
          fontWeight: FontWeight.w600,
          color: colors.onSurfaceVariant,
        ),
      ),
    );
  }
}

String _initials(String? name) {
  final List<String> parts = (name ?? '')
      .trim()
      .split(RegExp(r'\s+'))
      .where((String p) => p.isNotEmpty)
      .toList();
  if (parts.isEmpty) return '';
  if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
  return (parts.first.substring(0, 1) + parts.last.substring(0, 1))
      .toUpperCase();
}
