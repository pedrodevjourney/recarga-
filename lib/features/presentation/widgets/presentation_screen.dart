import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recarga/core/theme/app_theme.dart';
import 'package:recarga/features/presentation/view_models/presentation_viewmodel.dart';
import 'package:recarga/l10n/app_localizations.dart';

class PresentationScreen extends StatelessWidget {
  const PresentationScreen({super.key, required this.viewModel});

  final PresentationViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final heroWords = [
      l10n.presentationHeroWordFind,
      l10n.presentationHeroWordSchedule,
      l10n.presentationHeroWordCharge,
    ];

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
                  padding: const EdgeInsets.fromLTRB(32, 40, 32, 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.translate(
                            offset: const Offset(-32, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/recarga_branco_sem_bg.png',
                                  height: 100,
                                  width: 100,
                                  filterQuality: FilterQuality.high,
                                ),
                                Transform.translate(
                                  offset: const Offset(-25, 0),
                                  child: Text(
                                    'ecarga+',
                                    style: textTheme.headlineMedium?.copyWith(
                                      color: colorScheme.onPrimary,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: AppFonts.display,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 500.ms, curve: Curves.easeOutCubic)
                          .scale(
                            begin: const Offset(0.9, 0.9),
                            end: const Offset(1, 1),
                            duration: 500.ms,
                            curve: Curves.easeOutCubic,
                          )
                          .slideX(
                            begin: -0.06,
                            end: 0,
                            curve: Curves.easeOutCubic,
                          ),
                      const SizedBox(height: 20),
                      DefaultTextStyle(
                            style: textTheme.headlineLarge!.copyWith(
                              color: colorScheme.onPrimary,
                              fontWeight: FontWeight.w500,
                              fontSize: 34,
                              fontFamily: AppFonts.display,
                            ),
                            textAlign: TextAlign.start,
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              runSpacing: 6,
                              children: [
                                Text(l10n.presentationHeroPrefix),
                                AnimatedTextKit(
                                  animatedTexts: heroWords
                                      .map(
                                        (word) => TypewriterAnimatedText(
                                          word,
                                          textStyle: textTheme.headlineLarge!
                                              .copyWith(
                                                color: colorScheme.onPrimary,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 34,
                                                fontFamily: AppFonts.display,
                                                height: 1.2,
                                              ),
                                          speed: const Duration(
                                            milliseconds: 180,
                                          ),
                                          cursor: '',
                                        ),
                                      )
                                      .toList(),
                                  repeatForever: true,
                                  displayFullTextOnTap: true,
                                  pause: const Duration(milliseconds: 2800),
                                ),
                                const Text(' '),
                                Text(l10n.presentationHeroSuffix),
                              ],
                            ),
                          )
                          .animate()
                          .fadeIn(
                            duration: 550.ms,
                            delay: 220.ms,
                            curve: Curves.easeOutCubic,
                          )
                          .slideY(
                            begin: 0.12,
                            end: 0,
                            duration: 550.ms,
                            delay: 220.ms,
                            curve: Curves.easeOutCubic,
                          ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                            child: Text(
                              l10n.presentationSubtitle,
                              style: textTheme.titleMedium?.copyWith(
                                color: colorScheme.onSurface,
                                fontSize: 18,
                                fontFamily: AppFonts.body,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                        .animate()
                        .fadeIn(
                          duration: 450.ms,
                          delay: 520.ms,
                          curve: Curves.easeOutCubic,
                        )
                        .slideY(
                          begin: 0.08,
                          end: 0,
                          duration: 450.ms,
                          delay: 520.ms,
                          curve: Curves.easeOutCubic,
                        ),
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
                                    l10n.presentationLoginButton,
                                    style: textTheme.titleMedium?.copyWith(
                                      color: colorScheme.onPrimary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                              .animate()
                              .fadeIn(
                                duration: 450.ms,
                                delay: 720.ms,
                                curve: Curves.easeOutCubic,
                              )
                              .slideY(
                                begin: 0.18,
                                end: 0,
                                duration: 450.ms,
                                delay: 720.ms,
                                curve: Curves.easeOutCubic,
                              ),
                          const SizedBox(width: 16),
                          Expanded(
                                child: OutlinedButton(
                                  onPressed: viewModel.onSignUpPressed,
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: colorScheme.onSurface,
                                    side: BorderSide(
                                      color: colorScheme.primary,
                                    ),
                                    minimumSize: const Size.fromHeight(52),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    l10n.presentationSignUpButton,
                                    style: textTheme.titleMedium?.copyWith(
                                      color: colorScheme.onSurface,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                              .animate()
                              .fadeIn(
                                duration: 450.ms,
                                delay: 880.ms,
                                curve: Curves.easeOutCubic,
                              )
                              .slideY(
                                begin: 0.18,
                                end: 0,
                                duration: 450.ms,
                                delay: 880.ms,
                                curve: Curves.easeOutCubic,
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
