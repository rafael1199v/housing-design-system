import 'package:flutter/widgets.dart';

/// Raw colour palette: the single source of truth for every hex value.
///
/// These constants feed the [ColorScheme]s in `theme/color_schemes.dart` and
/// the [AppSemanticColors] extension. Widgets should **not** read these
/// directly — they read from `Theme.of(context).colorScheme` instead, so a
/// single theme swap reskins the whole app. They live here only to keep the
/// scheme definitions readable.
abstract final class AppColors {
  AppColors._();

  // --- Brand greens -------------------------------------------------------
  /// Primary brand green used by the student app.
  static const Color studentPrimary = Color(0xFF003D33);

  /// Slightly bluer teal used by the householder app.
  static const Color householderPrimary = Color(0xFF003F47);

  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFB8EDDF);
  static const Color onPrimaryContainer = Color(0xFF00251E);

  // --- Secondary / tertiary ----------------------------------------------
  static const Color secondary = Color(0xFF4E6952);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFC9E7CA);
  static const Color onSecondaryContainer = Color(0xFF0B1F13);

  static const Color tertiary = Color(0xFF1A4F44);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFBDEBDD);
  static const Color onTertiaryContainer = Color(0xFF00201A);

  // --- Error --------------------------------------------------------------
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF410002);

  // --- Surfaces & text ----------------------------------------------------
  static const Color surface = Color(0xFFF8FAF8);
  static const Color onSurface = Color(0xFF191C1B);
  static const Color onSurfaceVariant = Color(0xFF404946);

  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF2F4F2);
  static const Color surfaceContainer = Color(0xFFECEEEC);
  static const Color surfaceContainerHigh = Color(0xFFE6E9E7);
  static const Color surfaceContainerHighest = Color(0xFFE1E3E1);
  static const Color surfaceDim = Color(0xFFD8DAD9);
  static const Color surfaceBright = Color(0xFFF8FAF8);

  // --- Outlines -----------------------------------------------------------
  static const Color outline = Color(0xFF707976);
  static const Color outlineVariant = Color(0xFFC0C8C4);

  // --- Inverse ------------------------------------------------------------
  static const Color inverseSurface = Color(0xFF2D312F);
  static const Color onInverseSurface = Color(0xFFEFF1EF);
  static const Color inversePrimary = Color(0xFF80D4C4);

  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);

  // --- Extra semantic colours (outside Material's ColorScheme) ------------
  // Carried into the theme via [AppSemanticColors] so they stay theme-driven.
  static const Color success = Color(0xFF2E7D5B);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color successContainer = Color(0xFFE3F1EA);

  static const Color accent = Color(0xFFB07B3E);
  static const Color onAccent = Color(0xFFFFFFFF);
  static const Color accentContainer = Color(0xFFF6ECDF);

  // =======================================================================
  // DARK THEME PALETTE
  // Material 3 dark conventions derived from the same brand teal. Feeds the
  // dark [ColorScheme]s in `theme/color_schemes.dart`.
  // =======================================================================

  // --- Dark brand greens (lighter so they read on dark surfaces) ----------
  static const Color studentPrimaryDark = Color(0xFF80D4C4);
  static const Color householderPrimaryDark = Color(0xFF7CD3DE);
  static const Color onPrimaryDark = Color(0xFF00382F);
  static const Color primaryContainerDark = Color(0xFF005046);
  static const Color onPrimaryContainerDark = Color(0xFFB8EDDF);

  // --- Dark secondary / tertiary -----------------------------------------
  static const Color secondaryDark = Color(0xFFB1CCB4);
  static const Color onSecondaryDark = Color(0xFF1D3525);
  static const Color secondaryContainerDark = Color(0xFF344B3B);
  static const Color onSecondaryContainerDark = Color(0xFFC9E7CA);

  static const Color tertiaryDark = Color(0xFFA1D4C3);
  static const Color onTertiaryDark = Color(0xFF00382E);
  static const Color tertiaryContainerDark = Color(0xFF00513F);
  static const Color onTertiaryContainerDark = Color(0xFFBDEBDD);

  // --- Dark error ---------------------------------------------------------
  static const Color errorDark = Color(0xFFFFB4AB);
  static const Color onErrorDark = Color(0xFF690005);
  static const Color errorContainerDark = Color(0xFF93000A);
  static const Color onErrorContainerDark = Color(0xFFFFDAD6);

  // --- Dark surfaces & text ----------------------------------------------
  static const Color surfaceDark = Color(0xFF0F1513);
  static const Color onSurfaceDark = Color(0xFFDEE4E1);
  static const Color onSurfaceVariantDark = Color(0xFFBFC9C4);

  static const Color surfaceContainerLowestDark = Color(0xFF0A0F0E);
  static const Color surfaceContainerLowDark = Color(0xFF171D1B);
  static const Color surfaceContainerDark = Color(0xFF1B211F);
  static const Color surfaceContainerHighDark = Color(0xFF252B29);
  static const Color surfaceContainerHighestDark = Color(0xFF303634);
  static const Color surfaceDimDark = Color(0xFF0F1513);
  static const Color surfaceBrightDark = Color(0xFF353B39);

  // --- Dark outlines ------------------------------------------------------
  static const Color outlineDark = Color(0xFF899390);
  static const Color outlineVariantDark = Color(0xFF3F4946);

  // --- Dark inverse -------------------------------------------------------
  static const Color inverseSurfaceDark = Color(0xFFDEE4E1);
  static const Color onInverseSurfaceDark = Color(0xFF2D312F);
  static const Color inversePrimaryDark = Color(0xFF006A5B);

  // --- Dark extra semantic colours ---------------------------------------
  // Muted containers + lighter foregrounds.
  static const Color successDark = Color(0xFF7FD8B0);
  static const Color onSuccessDark = Color(0xFF003824);
  static const Color successContainerDark = Color(0xFF1E3A2C);

  static const Color accentDark = Color(0xFFE5BE8C);
  static const Color onAccentDark = Color(0xFF432C0E);
  static const Color accentContainerDark = Color(0xFF3A2E1E);
}
