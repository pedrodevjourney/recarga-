import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('pt'),
    Locale('en'),
    Locale('es'),
  ];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'Recarga+'**
  String get appTitle;

  /// Start of hero sentence before animated word
  ///
  /// In en, this message translates to:
  /// **'The smartest way to '**
  String get presentationHeroPrefix;

  /// End of hero sentence after animated word
  ///
  /// In en, this message translates to:
  /// **'your electric car.'**
  String get presentationHeroSuffix;

  /// No description provided for @presentationHeroWordFind.
  ///
  /// In en, this message translates to:
  /// **'find'**
  String get presentationHeroWordFind;

  /// No description provided for @presentationHeroWordSchedule.
  ///
  /// In en, this message translates to:
  /// **'schedule'**
  String get presentationHeroWordSchedule;

  /// No description provided for @presentationHeroWordCharge.
  ///
  /// In en, this message translates to:
  /// **'charge'**
  String get presentationHeroWordCharge;

  /// Presentation screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Your next charge, one tap away.'**
  String get presentationSubtitle;

  /// No description provided for @presentationLoginButton.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get presentationLoginButton;

  /// No description provided for @presentationSignUpButton.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get presentationSignUpButton;

  /// No description provided for @loginScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get loginScreenTitle;

  /// No description provided for @loginHeadline.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get loginHeadline;

  /// No description provided for @loginSubtext.
  ///
  /// In en, this message translates to:
  /// **'Log in to schedule charges and manage your electric car.'**
  String get loginSubtext;

  /// No description provided for @loginEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginEmailLabel;

  /// No description provided for @loginEmailHint.
  ///
  /// In en, this message translates to:
  /// **'example@email.com'**
  String get loginEmailHint;

  /// No description provided for @loginPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPasswordLabel;

  /// No description provided for @loginPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get loginPasswordHint;

  /// No description provided for @loginForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get loginForgotPassword;

  /// No description provided for @loginButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get loginButtonLabel;

  /// No description provided for @loginOrContinueWith.
  ///
  /// In en, this message translates to:
  /// **'or continue with'**
  String get loginOrContinueWith;

  /// No description provided for @loginSignInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get loginSignInWithGoogle;

  /// No description provided for @loginSignInWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get loginSignInWithApple;

  /// No description provided for @loginNoAccountPrompt.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get loginNoAccountPrompt;

  /// No description provided for @loginSignUpLink.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get loginSignUpLink;

  /// No description provided for @signUpScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUpScreenTitle;

  /// No description provided for @signUpHeadline.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get signUpHeadline;

  /// No description provided for @signUpSubtext.
  ///
  /// In en, this message translates to:
  /// **'Built for electric car owners. Schedule charges and manage your routine in the palm of your hand.'**
  String get signUpSubtext;

  /// No description provided for @signUpFullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get signUpFullNameLabel;

  /// No description provided for @signUpFullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get signUpFullNameHint;

  /// No description provided for @signUpEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get signUpEmailLabel;

  /// No description provided for @signUpEmailHint.
  ///
  /// In en, this message translates to:
  /// **'example@email.com'**
  String get signUpEmailHint;

  /// No description provided for @signUpPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signUpPasswordLabel;

  /// No description provided for @signUpPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get signUpPasswordHint;

  /// No description provided for @signUpTermsCheckbox.
  ///
  /// In en, this message translates to:
  /// **'I agree to the terms of use and privacy policy.'**
  String get signUpTermsCheckbox;

  /// No description provided for @signUpSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUpSubmitButton;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
