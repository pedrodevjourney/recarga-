import 'package:flutter/material.dart';
import 'package:recarga/core/theme/app_theme.dart';
import 'package:recarga/core/widgets/labeled_field.dart';
import 'package:recarga/features/sign_up/view_models/sign_up_viewmodel.dart';
import 'package:recarga/l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.viewModel});

  final SignUpViewModel viewModel;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  String? _validationError;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final viewModel = widget.viewModel;

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
                  _SignUpFormFields(
                    fullNameController: _fullNameController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  if (_validationError != null ||
                      viewModel.errorMessage != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      _validationError ??
                          (viewModel.errorMessage!.isEmpty
                              ? AppLocalizations.of(context)!.genericRequestError
                              : viewModel.errorMessage!),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.error,
                        fontFamily: AppFonts.body,
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  _TermsCheckbox(
                    value: viewModel.agreeToTerms,
                    onChanged: viewModel.setAgreeToTerms,
                  ),
                  const SizedBox(height: 24),
                  _SignUpSubmitButton(
                    isLoading: viewModel.isLoading,
                    onPressed: () {
                      final l10n = AppLocalizations.of(context)!;
                      final name = _fullNameController.text.trim();
                      final email = _emailController.text.trim();
                      final password = _passwordController.text;
                      if (!viewModel.agreeToTerms) {
                        setState(() => _validationError = l10n.signUpAcceptTerms);
                        return;
                      }
                      if (name.isEmpty || email.isEmpty || password.isEmpty) {
                        setState(() => _validationError = l10n.signUpFillFields);
                        return;
                      }
                      setState(() => _validationError = null);
                      viewModel.register(
                        _fullNameController.text,
                        _emailController.text,
                        password,
                      );
                    },
                  ),
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
  const _SignUpFormFields({
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LabeledField(
          controller: fullNameController,
          label: AppLocalizations.of(context)!.signUpFullNameLabel,
          hint: AppLocalizations.of(context)!.signUpFullNameHint,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 20),
        LabeledField(
          controller: emailController,
          label: AppLocalizations.of(context)!.signUpEmailLabel,
          hint: AppLocalizations.of(context)!.signUpEmailHint,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 20),
        LabeledField(
          controller: passwordController,
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
  const _SignUpSubmitButton({
    required this.isLoading,
    required this.onPressed,
  });

  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        disabledBackgroundColor: colorScheme.primary.withValues(alpha: 0.6),
        disabledForegroundColor: colorScheme.onPrimary,
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: isLoading
          ? SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(colorScheme.onPrimary),
              ),
            )
          : Text(
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
