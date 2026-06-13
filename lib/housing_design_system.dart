/// Housing Design System — the shared Flutter design system for the student
/// and householder apps.
///
/// A single import gives you the tokens, the theme builder and every component:
/// ```dart
/// import 'package:housing_design_system/housing_design_system.dart';
/// ```
library;

// Components — layout.
export 'src/components/layout/app_bottom_nav_bar.dart';
export 'src/components/layout/app_chip.dart';
export 'src/components/layout/app_labeled_divider.dart';
export 'src/components/layout/app_scaffold.dart';
export 'src/components/layout/app_section_header.dart';

// Responsive helpers.
export 'src/responsive/breakpoints.dart';

// Theme (ColorSchemes + the AppTheme builder).
export 'src/theme/app_theme.dart';
export 'src/theme/color_schemes.dart';

// Tokens (colours, spacing, radii, elevation, typography, semantic colours).
export 'src/tokens/tokens.dart';
