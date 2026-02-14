import 'package:flutter/material.dart';
import 'package:recarga/core/theme/app_theme.dart';
import 'package:recarga/core/widgets/labeled_field.dart';
import 'package:recarga/features/login/view_models/login_viewmodel.dart';
import 'package:recarga/l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  String? _validationError;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
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
              AppLocalizations.of(context)!.loginScreenTitle,
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
                  const _LoginHeader(),
                  const SizedBox(height: 28),
                  _LoginFormFields(
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
                  _ForgotPasswordLink(onPressed: viewModel.onForgotPassword),
                  const SizedBox(height: 24),
                  _LoginSubmitButton(
                    isLoading: viewModel.isLoading,
                    onPressed: () {
                      final l10n = AppLocalizations.of(context)!;
                      final email = _emailController.text.trim();
                      final password = _passwordController.text;
                      if (email.isEmpty || password.isEmpty) {
                        setState(() => _validationError = l10n.loginFillFields);
                        return;
                      }
                      setState(() => _validationError = null);
                      viewModel.login(_emailController.text, password);
                    },
                  ),
                  const SizedBox(height: 24),
                  const _DividerWithLabel(),
                  const SizedBox(height: 24),
                  _SocialSignInButtons(
                    onGooglePressed: viewModel.onSignInWithGoogle,
                    onApplePressed: viewModel.onSignInWithApple,
                  ),
                  const SizedBox(height: 32),
                  _NoAccountRow(onSignUpPressed: viewModel.onSignUpPressed),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LoginFormFields extends StatelessWidget {
  const _LoginFormFields({
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LabeledField(
          controller: emailController,
          label: AppLocalizations.of(context)!.loginEmailLabel,
          hint: AppLocalizations.of(context)!.loginEmailHint,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 20),
        LabeledField(
          controller: passwordController,
          label: AppLocalizations.of(context)!.loginPasswordLabel,
          hint: AppLocalizations.of(context)!.loginPasswordHint,
          obscureText: true,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}

class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppLocalizations.of(context)!.loginHeadline,
          style: textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
            fontFamily: AppFonts.display,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppLocalizations.of(context)!.loginSubtext,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.9),
            height: 1.4,
            fontFamily: AppFonts.subtitle,
          ),
        ),
      ],
    );
  }
}

class _ForgotPasswordLink extends StatelessWidget {
  const _ForgotPasswordLink({required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          AppLocalizations.of(context)!.loginForgotPassword,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontFamily: AppFonts.body,
          ),
        ),
      ),
    );
  }
}

class _LoginSubmitButton extends StatelessWidget {
  const _LoginSubmitButton({
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
              AppLocalizations.of(context)!.loginButtonLabel,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.body,
              ),
            ),
    );
  }
}

class _DividerWithLabel extends StatelessWidget {
  const _DividerWithLabel();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: Divider(color: colorScheme.onSurface.withValues(alpha: 0.3)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            AppLocalizations.of(context)!.loginOrContinueWith,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
              fontFamily: AppFonts.body,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: colorScheme.onSurface.withValues(alpha: 0.3)),
        ),
      ],
    );
  }
}

class _SocialSignInButtons extends StatelessWidget {
  const _SocialSignInButtons({
    required this.onGooglePressed,
    required this.onApplePressed,
  });

  final VoidCallback? onGooglePressed;
  final VoidCallback? onApplePressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OutlinedButton.icon(
          onPressed: onGooglePressed,
          icon: Icon(
            Icons.g_mobiledata,
            color: colorScheme.onSurface,
            size: 26,
          ),
          label: Text(
            AppLocalizations.of(context)!.loginSignInWithGoogle,
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.body,
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: colorScheme.primary.withValues(alpha: 0.7)),
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: onApplePressed,
          icon: Icon(Icons.apple, color: colorScheme.onSurface, size: 26),
          label: Text(
            AppLocalizations.of(context)!.loginSignInWithApple,
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.body,
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: colorScheme.primary.withValues(alpha: 0.7)),
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}

class _NoAccountRow extends StatelessWidget {
  const _NoAccountRow({required this.onSignUpPressed});

  final VoidCallback? onSignUpPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.loginNoAccountPrompt,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.85),
            fontFamily: AppFonts.body,
          ),
        ),
        GestureDetector(
          onTap: onSignUpPressed,
          child: Text(
            AppLocalizations.of(context)!.loginSignUpLink,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.body,
            ),
          ),
        ),
      ],
    );
  }
}
