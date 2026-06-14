import 'package:flutter/material.dart';

import 'app_colors.dart';

@immutable
class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  const AppSemanticColors({
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.accent,
    required this.onAccent,
    required this.accentContainer,
  });

  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color accent;
  final Color onAccent;
  final Color accentContainer;

  static const AppSemanticColors standard = AppSemanticColors(
    success: AppColors.success,
    onSuccess: AppColors.onSuccess,
    successContainer: AppColors.successContainer,
    accent: AppColors.accent,
    onAccent: AppColors.onAccent,
    accentContainer: AppColors.accentContainer,
  );

  @override
  AppSemanticColors copyWith({
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? accent,
    Color? onAccent,
    Color? accentContainer,
  }) {
    return AppSemanticColors(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      accentContainer: accentContainer ?? this.accentContainer,
    );
  }

  @override
  AppSemanticColors lerp(ThemeExtension<AppSemanticColors>? other, double t) {
    if (other is! AppSemanticColors) return this;
    return AppSemanticColors(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      successContainer: Color.lerp(successContainer, other.successContainer, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      onAccent: Color.lerp(onAccent, other.onAccent, t)!,
      accentContainer: Color.lerp(accentContainer, other.accentContainer, t)!,
    );
  }
}
