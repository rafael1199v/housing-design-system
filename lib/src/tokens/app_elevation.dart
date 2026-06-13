import 'package:flutter/widgets.dart';

abstract final class AppElevation {
  AppElevation._();

  static const List<BoxShadow> level0 = <BoxShadow>[];

  static const List<BoxShadow> level1 = <BoxShadow>[
    BoxShadow(color: Color(0x14000000), offset: Offset(0, 2), blurRadius: 6),
  ];

  static const List<BoxShadow> level2 = <BoxShadow>[
    BoxShadow(color: Color(0x0F000000), offset: Offset(0, 6), blurRadius: 18),
  ];

  static const List<BoxShadow> level3 = <BoxShadow>[
    BoxShadow(color: Color(0x14000000), offset: Offset(0, 8), blurRadius: 24),
  ];

  static const double glassBlurSigma = 12;
}
