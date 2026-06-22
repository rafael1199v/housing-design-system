# Housing Design System

The shared Flutter design system that powers the **student** and **householder** housing
apps. It bundles design **tokens**, a Material 3 **theme** and a library of ready-made
**components** so every app looks and behaves consistently from a single import:

```dart
import 'package:housing_design_system/housing_design_system.dart';
```

## Highlights

- **Material 3** foundation with `useMaterial3: true` and component themes pre-wired.
- **Two brands × light/dark** — Student and Householder, each with a light and a dark theme
  (four `ThemeData`s in total).
- **Design tokens** — colors, spacing, radii, elevation and a typography scale (Plus Jakarta
  Sans via `google_fonts`).
- **Semantic colors** (`success`, `accent`) exposed as a `ThemeExtension`, so they survive
  theme switches and `lerp` smoothly.
- **Responsive helpers** — `Breakpoints` / `WindowSize` for compact / medium / expanded layouts.
- **~25 components** covering brand, buttons, cards, chat, feedback, inputs, layout and media.
- **Widgetbook catalog** documenting every component across its states and all four themes.

## Requirements

| Tool    | Version       |
| ------- | ------------- |
| Flutter | `>= 3.27.0`   |
| Dart SDK | `>= 3.6.0 <4.0.0` |

Runtime dependencies (`google_fonts`, `flutter_svg`) are pulled in transitively — you do not
need to add them yourself.

## Main components

All components are prefixed with `App` and exported from the single barrel file.

| Group        | Components | What they're for |
| ------------ | ---------- | ---------------- |
| **Brand**    | `AppBrandLogo` | The product wordmark / logo lockup. |
| **Buttons**  | `AppPrimaryButton`, `AppSecondaryButton`, `AppTextButton`, `AppGoogleButton` | Filled / outlined / text actions plus a Google sign-in button, each with `isLoading` and icon support. |
| **Cards**    | `AppCard`, `AppImageCard`, `AppAuthCard` | A base surface card, an image-led card, and a responsive auth container. |
| **Chat**     | `AppChatBubble`, `AppChatListTile`, `AppMessageComposer` | Message bubbles, conversation list rows and the message input bar. |
| **Feedback** | `AppStatusBadge` | Small status pills (e.g. pending / approved) driven by semantic colors. |
| **Inputs**   | `AppTextField`, `AppDateField`, `AppDropdownField`, `AppSearchBar`, `AppSegmentedToggle`, `AppSelectableOption`, `AppFieldLabel`, `AppFormSection` | Form fields, a search bar, segmented/selectable controls and a responsive two-column form section. |
| **Layout**   | `AppScaffold`, `AppBottomNavBar`, `AppChip`, `AppSectionHeader`, `AppLabeledDivider` | Page chrome, bottom navigation, chips, section headers and labeled dividers. |
| **Media**    | `AppAvatar` | User / entity avatars. |

## Design foundations

### Tokens

```dart
// Spacing — xs (4) · sm (8) · md (12) · lg (16) · xl (24) · xxl (32) · xxxl (48)
Padding(padding: EdgeInsets.all(AppSpacing.lg), child: ...);
AppSpacing.gapMd; // const SizedBox(12 x 12) for quick gaps

// Radii — xs · sm · md · lg · xl · xxl · pill (each a BorderRadius)
ClipRRect(borderRadius: AppRadii.lg, child: ...);

// Elevation — soft shadow sets: level0..level3 (+ glassBlurSigma)
Container(decoration: BoxDecoration(boxShadow: AppElevation.level1));

// Typography — the full Material text scale in Plus Jakarta Sans
Text('Title', style: Theme.of(context).textTheme.titleLarge);
```

### Semantic colors

`success` and `accent` live on `AppSemanticColors`, a `ThemeExtension` registered by the
theme. Read them off the context:

```dart
final semantics = Theme.of(context).extension<AppSemanticColors>()!;
Container(color: semantics.successContainer);
```

### Responsive breakpoints

```dart
// WindowSize: compact (< 600) · medium (600–899) · expanded (>= 900)
if (Breakpoints.isExpanded(context)) {
  // two-column layout
}
final size = Breakpoints.ofContext(context);
```

## Theming

`AppTheme` exposes the four ready-made themes, plus a `from(...)` builder if you need a custom
`ColorScheme`:

```dart
AppTheme.student         // Student · light
AppTheme.studentDark     // Student · dark
AppTheme.householder     // Householder · light
AppTheme.householderDark // Householder · dark

// Build your own from a ColorScheme (optionally override semantic colors):
final custom = AppTheme.from(myScheme, semantics: AppSemanticColors.dark);
```

Wire it into your app:

```dart
MaterialApp(
  theme: AppTheme.student,
  darkTheme: AppTheme.studentDark,
  home: const HomePage(),
);
```

## Quick start

```dart
import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.householder,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppTextField(
                label: 'Email',
                hintText: 'you@example.com',
                prefixIcon: Icons.mail_outline,
              ),
              AppSpacing.gapLg,
              AppPrimaryButton(
                label: 'Continue',
                expanded: true,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Running the Widgetbook

The [`widgetbook/`](widgetbook/) folder is an interactive catalog that consumes this package
through a local path dependency (`path: ../`), so it always reflects the current source.

```bash
cd widgetbook
flutter pub get
dart run build_runner build   # generates lib/main.directories.g.dart
flutter run -d chrome
```

While iterating on use-cases, keep the generator running in watch mode:

```bash
dart run build_runner watch
```

The catalog ships **Theme**, **Viewport**, **Text scale** and other addons so you can preview
each component across the four themes and at different screen sizes. See
[`WIDGETBOOK.md`](WIDGETBOOK.md) for the full tour, addon details and how to add a use-case.

## Adding it to another project

This package is **not published to pub.dev** (`publish_to: none`), so consume it via a path or
git dependency.

**Same repository / workspace** — point at the package folder:

```yaml
# pubspec.yaml of the consuming app
dependencies:
  housing_design_system:
    path: ../proyecto-final-design-system
```

**Separate repository** — reference it over git:

```yaml
dependencies:
  housing_design_system:
    git:
      url: https://github.com/<org>/<repo>.git
      path: proyecto-final-design-system   # omit if the package is at the repo root
      ref: main                            # branch, tag or commit
```

Then fetch and use it:

```bash
flutter pub get
```

```dart
import 'package:housing_design_system/housing_design_system.dart';
// MaterialApp(theme: AppTheme.student, ...)
```

`google_fonts` and `flutter_svg` come along transitively — no extra entries required.

## Project layout

```
proyecto-final-design-system/
├── lib/
│   ├── housing_design_system.dart   # public barrel (single import)
│   └── src/
│       ├── tokens/                  # colors, spacing, radii, elevation, typography, semantic colors
│       ├── theme/                   # AppTheme builder + ColorSchemes
│       ├── responsive/              # Breakpoints / WindowSize
│       └── components/              # brand · buttons · cards · chat · feedback · inputs · layout · media
└── widgetbook/                      # interactive component catalog
```

## License

See [`LICENSE`](LICENSE).
