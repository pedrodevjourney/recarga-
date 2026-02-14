import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../view_models/presentation_viewmodel.dart';

class PresentationScreen extends StatelessWidget {
  const PresentationScreen({super.key, required this.viewModel});

  final PresentationViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          body: Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  color: colorScheme.primary,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultTextStyle(
                        style: textTheme.headlineLarge!.copyWith(
                          color: colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                          fontFamily: 'Bungee',
                        ),
                        textAlign: TextAlign.start,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          runSpacing: 6,
                          children: [
                            Text(PresentationViewModel.heroSentencePrefix),
                            AnimatedTextKit(
                              animatedTexts: PresentationViewModel.heroWords
                                  .map(
                                    (word) => TypewriterAnimatedText(
                                      word,
                                      textStyle: textTheme.headlineLarge!
                                          .copyWith(
                                            color: colorScheme.onPrimary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 34,
                                            fontFamily: 'Bungee',
                                            height: 1.2,
                                          ),
                                      speed: const Duration(milliseconds: 180),
                                      cursor: '',
                                    ),
                                  )
                                  .toList(),
                              repeatForever: true,
                              displayFullTextOnTap: true,
                              pause: const Duration(milliseconds: 2800),
                            ),
                            const Text(' '),
                            Text(PresentationViewModel.heroSentenceSuffix),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: viewModel.onLoginPressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.primary,
                                foregroundColor: colorScheme.onPrimary,
                                minimumSize: const Size.fromHeight(52),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                PresentationViewModel.loginButtonLabel,
                                style: textTheme.titleMedium?.copyWith(
                                  color: colorScheme.onPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: viewModel.onSignUpPressed,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: colorScheme.onSurface,
                                side: BorderSide(color: colorScheme.primary),
                                minimumSize: const Size.fromHeight(52),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                PresentationViewModel.signUpButtonLabel,
                                style: textTheme.titleMedium?.copyWith(
                                  color: colorScheme.onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
