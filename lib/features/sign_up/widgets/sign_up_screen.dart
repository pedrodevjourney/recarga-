import 'package:flutter/material.dart';
import 'package:recarga/core/theme/app_theme.dart';
import 'package:recarga/core/widgets/labeled_field.dart';
import 'package:recarga/features/sign_up/view_models/sign_up_viewmodel.dart';
import 'package:recarga/l10n/app_localizations.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, required this.viewModel});

  final SignUpViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            backgroundColor: colorScheme.surface,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: colorScheme.onSurface,
              ),
              onPressed: viewModel.onBackPressed,
            ),
            title: Text(
              AppLocalizations.of(context)!.signUpScreenTitle,
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.body,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  const _SignUpHeader(),
                  const SizedBox(height: 28),
                  const _SignUpFormFields(),
                  const SizedBox(height: 20),
                  _TermsCheckbox(
                    value: viewModel.agreeToTerms,
                    onChanged: viewModel.setAgreeToTerms,
                  ),
                  const SizedBox(height: 24),
                  const _SignUpSubmitButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SignUpHeader extends StatelessWidget {
  const _SignUpHeader();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppLocalizations.of(context)!.signUpHeadline,
          style: textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
            fontFamily: AppFonts.display,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppLocalizations.of(context)!.signUpSubtext,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.95),
            height: 1.4,
            fontFamily: AppFonts.subtitle,
          ),
        ),
      ],
    );
  }
}

class _SignUpFormFields extends StatelessWidget {
  const _SignUpFormFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LabeledField(
          label: AppLocalizations.of(context)!.signUpFullNameLabel,
          hint: AppLocalizations.of(context)!.signUpFullNameHint,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 20),
        LabeledField(
          label: AppLocalizations.of(context)!.signUpEmailLabel,
          hint: AppLocalizations.of(context)!.signUpEmailHint,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 20),
        LabeledField(
          label: AppLocalizations.of(context)!.signUpPasswordLabel,
          hint: AppLocalizations.of(context)!.signUpPasswordHint,
          obscureText: true,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}

class _TermsCheckbox extends StatelessWidget {
  const _TermsCheckbox({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: value,
            onChanged: (v) => onChanged(v ?? false),
            activeColor: colorScheme.primary,
            fillColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return colorScheme.primary;
              }
              return Colors.transparent;
            }),
            side: BorderSide(color: colorScheme.primary.withValues(alpha: 0.9)),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: GestureDetector(
              onTap: () => onChanged(!value),
              child: Text(
                AppLocalizations.of(context)!.signUpTermsCheckbox,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.9),
                  fontFamily: AppFonts.body,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SignUpSubmitButton extends StatelessWidget {
  const _SignUpSubmitButton();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        AppLocalizations.of(context)!.signUpSubmitButton,
        style: textTheme.titleMedium?.copyWith(
          color: colorScheme.onPrimary,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.body,
        ),
      ),
    );
  }
}
