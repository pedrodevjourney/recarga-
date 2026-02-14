import 'package:flutter/material.dart';
import 'package:recarga/core/theme/app_theme.dart';

/// Campo de formulário com label em cima, seguindo o padrão visual do app.
class LabeledField extends StatelessWidget {
  const LabeledField({
    super.key,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
  });

  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _FieldLabel(label: label),
        const SizedBox(height: 6),
        TextFormField(
          style: TextStyle(
            color: colorScheme.onSurface,
            fontFamily: AppFonts.body,
          ),
          decoration: _inputDecoration(context, hint: hint),
          keyboardType: keyboardType,
          obscureText: obscureText,
          textInputAction: textInputAction,
        ),
      ],
    );
  }

  static InputDecoration _inputDecoration(
    BuildContext context, {
    required String hint,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: colorScheme.surface,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: colorScheme.primary.withValues(alpha: 0.5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
      ),
      hintStyle: TextStyle(
        color: colorScheme.onSurface.withValues(alpha: 0.5),
        fontFamily: AppFonts.body,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      label,
      style: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.onSurface,
        fontWeight: FontWeight.bold,
        fontFamily: AppFonts.body,
      ),
    );
  }
}
