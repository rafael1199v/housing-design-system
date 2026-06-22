import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

void main() {
  runApp(const HousingWidgetbook());
}

@widgetbook.App()
class HousingWidgetbook extends StatelessWidget {
  const HousingWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Student · Light', data: AppTheme.student),
            WidgetbookTheme(
              name: 'Householder · Light',
              data: AppTheme.householder,
            ),
            WidgetbookTheme(name: 'Student · Dark', data: AppTheme.studentDark),
            WidgetbookTheme(
              name: 'Householder · Dark',
              data: AppTheme.householderDark,
            ),
          ],
        ),
        ViewportAddon(const [
          Viewports.none,
          IosViewports.iPhoneSE,
          IosViewports.iPhone13,
          AndroidViewports.samsungGalaxyS20,
          IosViewports.iPadPro11Inches,
          AndroidViewports.mediumTablet,
        ]),
        TextScaleAddon(initialScale: 1.0),
        AlignmentAddon(),
        ZoomAddon(),
        GridAddon(),
        InspectorAddon(),
      ],
    );
  }
}
