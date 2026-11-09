import 'package:material_ui/material_ui.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      _SocialButton(
        label: 'Google',
        assetPath: 'assets/images/google_logo.png',
      ),
      SizedBox(width: 22),
      _SocialButton(
        label: 'Apple',
        assetPath: 'assets/images/apple_logo.png',
      ),
      SizedBox(width: 22),
      _SocialButton(
        label: 'Facebook',
        assetPath: 'assets/images/facebook_logo.png',
      ),
    ],
  );
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.label, required this.assetPath});

  final String label;
  final String assetPath;

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: IconButton(
      tooltip: label,
      onPressed: _noop,
      visualDensity: VisualDensity.compact,
      icon: Image.asset(
        assetPath,
        width: 24,
        height: 24,
        semanticLabel: '$label logo',
      ),
    ),
  );
}

void _noop() {}
