import 'package:material_ui/material_ui.dart';

/// Shared colors and component styles based on the onboarding reference.
abstract final class AppTheme {
  static const Color primary = Color(0xFF51CBE0);
  static const Color accent = Color(0xFFF04E9A);
  static const Color ink = Color(0xFF292D35);
  static const Color mutedInk = Color(0xFF737985);
  static const Color blush = Color(0xFFFFE4EC);
  static const Color canvas = Color(0xFFFFFAFB);

  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFDDF7FB),
    onPrimaryContainer: Color(0xFF123E48),
    secondary: accent,
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFFFE1ED),
    onSecondaryContainer: Color(0xFF541832),
    tertiary: Color(0xFFFFC66D),
    onTertiary: ink,
    tertiaryContainer: Color(0xFFFFEFD3),
    onTertiaryContainer: Color(0xFF4B3510),
    error: Color(0xFFBA1A1A),
    onError: Colors.white,
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    surface: Colors.white,
    onSurface: ink,
    surfaceDim: Color(0xFFE8E2E4),
    surfaceBright: Colors.white,
    surfaceContainerLowest: Colors.white,
    surfaceContainerLow: Color(0xFFFFF8FA),
    surfaceContainer: Color(0xFFFFF1F5),
    surfaceContainerHigh: Color(0xFFF8EEF1),
    surfaceContainerHighest: Color(0xFFF2E8EB),
    onSurfaceVariant: mutedInk,
    outline: Color(0xFFD9CDD1),
    outlineVariant: Color(0xFFECE1E5),
    shadow: Color(0x1F292D35),
    scrim: Color(0x66000000),
    inverseSurface: Color(0xFF303034),
    onInverseSurface: Color(0xFFF7EFF1),
    inversePrimary: Color(0xFF63D4E7),
  );

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: canvas,
    fontFamily: 'Poppins',
    fontFamilyFallback: const ['Pyidaungsu'],
    appBarTheme: const AppBarTheme(
      backgroundColor: canvas,
      foregroundColor: ink,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: ink,
        fontWeight: FontWeight.w700,
        height: 1.12,
      ),
      headlineMedium: TextStyle(
        color: ink,
        fontWeight: FontWeight.w700,
        height: 1.15,
      ),
      titleLarge: TextStyle(color: ink, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(color: ink, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(color: ink),
      bodyMedium: TextStyle(color: mutedInk),
      bodySmall: TextStyle(color: mutedInk),
      labelLarge: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.5),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFFF4E9ED)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
      hintStyle: const TextStyle(color: Color(0xFF9AA0AA)),
      border: _inputBorder(const Color(0xFFF1E8EB)),
      enabledBorder: _inputBorder(const Color(0xFFF1E8EB)),
      focusedBorder: _inputBorder(primary, width: 1.5),
      errorBorder: _inputBorder(colorScheme.error),
      focusedErrorBorder: _inputBorder(colorScheme.error, width: 1.5),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: _buttonStyle(primary)),
    filledButtonTheme: FilledButtonThemeData(style: _buttonStyle(primary)),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: accent),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: accent,
      foregroundColor: Colors.white,
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFFF1E8EB),
      thickness: 1,
    ),
  );

  static OutlineInputBorder _inputBorder(Color color, {double width = 1}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color, width: width),
      );

  static ButtonStyle _buttonStyle(Color background) => ElevatedButton.styleFrom(
    backgroundColor: background,
    foregroundColor: Colors.white,
    minimumSize: const Size(0, 52),
    padding: const EdgeInsets.symmetric(horizontal: 24),
    elevation: 0,
    textStyle: const TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.6),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
  );
}
