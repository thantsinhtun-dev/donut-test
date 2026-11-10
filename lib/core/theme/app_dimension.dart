import 'package:material_ui/material_ui.dart';

class AppDimension {
  const AppDimension(this.size, this.orientation);

  final Size size;
  final Orientation orientation;

  double get width => size.width;
  double get height => size.height;
  bool get isPortrait => orientation == Orientation.portrait;
}

const double m1 = 4;
const double m2 = 8;
const double m3 = 12;
const double m4 = 16;
const double m5 = 20;
const double m6 = 24;
