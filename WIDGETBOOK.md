# Housing Design System — Widgetbook catalog

An interactive catalog of every component in `housing_design_system`, built with
[Widgetbook](https://widgetbook.io). It documents each component across its
states and the four design-system themes, plus a few composition *patterns*.

The package is consumed via a local path dependency (`path: ../`), so the
catalog always reflects the current source of the design system.

## Run it

```bash
cd widgetbook
flutter pub get
dart run build_runner build   # generates lib/main.directories.g.dart
flutter run -d chrome         # or: flutter run -d windows
```

While iterating on use-cases, keep the generator running:

```bash
dart run build_runner watch
```

## What's inside

- **Components** — `Brand`, `Buttons`, `Cards`, `Chat`, `Feedback`, `Inputs`,
  `Layout`. Each component has named use-cases for its canonical states
  (Default / Loading / Disabled / …) plus a `Playground` with live **knobs**.
- **Patterns** — composed templates (auth, register form, chat thread, chat
  list, listing cards) showing how the parts fit together. These are *not*
  navigable app screens; the consuming apps own the real screens and their logic.

## Addons

- **Theme** — switch between Student / Householder × Light / Dark.
- **Viewport** — resize from phone to tablet (drives the responsive
  `AppAuthCard` and the two-column `AppFormSection`: two columns appear at
  ≥ 900 px wide, the compact auth layout below 600 px).
- **Text scale**, **Alignment**, **Zoom**, **Grid**, **Inspector**.

## Adding a use-case

1. Create or edit a file under `lib/use_cases/<group>/`.
2. Annotate a `Widget Function(BuildContext)` with
   `@UseCase(name: '…', type: TheComponent, path: '[Components]/<Group>')`.
3. Re-run `dart run build_runner build`.

Helpers live in `lib/helpers/`:
- `wrappers.dart` — `boxed(...)` for intrinsic-size components, `semanticsOf(...)`
  for theme semantic colors, and the icon-knob helpers.
- `controller_host.dart` — owns/disposes a `TextEditingController` for input
  components (use `StatefulBuilder` for plain value state).
- `sample_data.dart` — demo data (chats, dropdown items, nav destinations).

## Deploy (optional)

`flutter build web` produces a static site under `build/web` that can be hosted
on GitHub Pages or pushed to Widgetbook Cloud.

> Note: the `windows` desktop target was removed to avoid the symlink/Developer
> Mode requirement of the `url_launcher` plugins. Re-add it with
> `flutter create --platforms windows .` after enabling Windows Developer Mode.
