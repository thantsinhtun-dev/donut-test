import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';

import '../../../../core/extensions/app_context_extension.dart';
import '../../../../core/theme/app_theme.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    this.controller,
    this.focusNode,
    this.initialValue,
    this.hintText,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.prefixText,
    this.inputFormatters,
    this.onChanged,
    this.enabled = true,
    super.key,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? initialValue;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final String? prefixText;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: controller,
    focusNode: focusNode,
    initialValue: initialValue,
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    inputFormatters: inputFormatters,
    onChanged: onChanged,
    enabled: enabled,
    onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
    style: context.bodyMedium.copyWith(color: AppTheme.ink),
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: prefixText == null
          ? null
          : Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 8, 0),
              child: Text(
                prefixText!.trimRight(),
                style: const TextStyle(color: Color(0xFF8A96A5)),
              ),
            ),
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    ),
  );
}
