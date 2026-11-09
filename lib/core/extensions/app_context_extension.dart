import 'package:flutter/material.dart';

import '../theme/app_dimension.dart';

extension AppContextExtension on BuildContext {
  AppDimension get dimension {
    final size = MediaQuery.sizeOf(this);
    final orientation = MediaQuery.orientationOf(this);
    return AppDimension(size, orientation);
  }

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  TextScaler get textScaler => MediaQuery.textScalerOf(this);

  TextStyle get titleLarge => textTheme.titleLarge!;
  TextStyle get titleMedium => textTheme.titleMedium!;
  TextStyle get titleSmall => textTheme.titleSmall!;

  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get bodySmall => textTheme.bodySmall!;

  TextStyle get labelLarge => textTheme.labelLarge!;
  TextStyle get labelMedium => textTheme.labelMedium!;
  TextStyle get labelSmall => textTheme.labelSmall!;

  double get iconExtraSmall => m1;
  double get iconSmall => m2;
  double get iconMedium => m3;
  double get iconLarge => m4;
}
