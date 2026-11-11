import 'package:material_ui/material_ui.dart';

class HomeOfflineBanner extends StatelessWidget {
  const HomeOfflineBanner({super.key});

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
    color: const Color(0xFF454B52),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.cloud_off, color: Colors.white, size: 14),
        SizedBox(width: 7),
        Text(
          'You’re offline. Showing saved content.',
          style: TextStyle(color: Colors.white, fontSize: 11),
        ),
      ],
    ),
  );
}
