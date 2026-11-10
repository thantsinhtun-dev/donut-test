import 'package:material_ui/material_ui.dart';
import 'package:toastification/toastification.dart';

void showPlaceholderAction(BuildContext context, String action) {
  toastification.show(
    context: context,
    type: ToastificationType.info,
    style: ToastificationStyle.flat,
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 2),
    title: Text(action),
    description: const Text('This action is a placeholder in this demo.'),
  );
}
