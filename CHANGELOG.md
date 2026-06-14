# Changelog

## 1.0.0

Initial unified release. Merges the two original design systems
(`householder_design_system` and `student_design_system`) into a single,
theme-driven package.

### Foundations
- Material 3 `ColorScheme` as the single styling source of truth.
- Two brand schemes: `studentColorScheme` and `householderColorScheme`.
- `AppTheme.student` / `AppTheme.householder` / `AppTheme.from(scheme)`.
- Unified tokens: `AppColors`, `AppSpacing`, `AppRadii`, `AppElevation`,
  `AppTypography`, and the `AppSemanticColors` theme extension (success/accent).
- `Breakpoints` responsive helper.

### Components
- Buttons: `AppPrimaryButton`, `AppSecondaryButton`, `AppTextButton`,
  `AppGoogleButton`.
- Cards: `AppCard`, `AppImageCard`, `AppAuthCard`.
- Inputs: `AppTextField`, `AppFieldLabel`, `AppSearchBar`,
  `AppSegmentedToggle`, `AppSelectableOption`.
- Layout: `AppScaffold`, `AppSectionHeader`, `AppChip`, `AppLabeledDivider`,
  `AppBottomNavBar`.
- Feedback: `AppStatusBadge`.
- Brand: `AppBrandLogo`.

### Migration notes
- All widgets are now theme-driven (read from `Theme.of(context)`), replacing
  the hard-coded colours of the original householder components.
- Spacing names standardised to the t-shirt scale (`xs … xxxl`).
- Components renamed under a consistent `App*` prefix.
