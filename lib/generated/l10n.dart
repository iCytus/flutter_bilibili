// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get homepage {
    return Intl.message(
      'Home',
      name: 'homepage',
      desc: '',
      args: [],
    );
  }

  /// `Trends`
  String get trendspage {
    return Intl.message(
      'Trends',
      name: 'trendspage',
      desc: '',
      args: [],
    );
  }

  /// `Mine`
  String get minepage {
    return Intl.message(
      'Mine',
      name: 'minepage',
      desc: '',
      args: [],
    );
  }

  /// `Live`
  String get live {
    return Intl.message(
      'Live',
      name: 'live',
      desc: '',
      args: [],
    );
  }

  /// `Recommend`
  String get recommended {
    return Intl.message(
      'Recommend',
      name: 'recommended',
      desc: '',
      args: [],
    );
  }

  /// `Hot`
  String get hot {
    return Intl.message(
      'Hot',
      name: 'hot',
      desc: '',
      args: [],
    );
  }

  /// `Videos`
  String get videos {
    return Intl.message(
      'Videos',
      name: 'videos',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get Posts {
    return Intl.message(
      'Posts',
      name: 'Posts',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get followers {
    return Intl.message(
      'Followers',
      name: 'followers',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get following {
    return Intl.message(
      'Following',
      name: 'following',
      desc: '',
      args: [],
    );
  }

  /// `settings`
  String get settings {
    return Intl.message(
      'settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `account`
  String get account {
    return Intl.message(
      'account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `private`
  String get private {
    return Intl.message(
      'private',
      name: 'private',
      desc: '',
      args: [],
    );
  }

  /// `receivingInformation`
  String get receivingInformation {
    return Intl.message(
      'receivingInformation',
      name: 'receivingInformation',
      desc: '',
      args: [],
    );
  }

  /// `splash`
  String get splash {
    return Intl.message(
      'splash',
      name: 'splash',
      desc: '',
      args: [],
    );
  }

  /// `recommendSetup`
  String get recommendSetup {
    return Intl.message(
      'recommendSetup',
      name: 'recommendSetup',
      desc: '',
      args: [],
    );
  }

  /// `play`
  String get play {
    return Intl.message(
      'play',
      name: 'play',
      desc: '',
      args: [],
    );
  }

  /// `cache`
  String get cache {
    return Intl.message(
      'cache',
      name: 'cache',
      desc: '',
      args: [],
    );
  }

  /// `binge`
  String get binge {
    return Intl.message(
      'binge',
      name: 'binge',
      desc: '',
      args: [],
    );
  }

  /// `message`
  String get message {
    return Intl.message(
      'message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `push`
  String get push {
    return Intl.message(
      'push',
      name: 'push',
      desc: '',
      args: [],
    );
  }

  /// `other`
  String get other {
    return Intl.message(
      'other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `timingClosure`
  String get timingClosure {
    return Intl.message(
      'timingClosure',
      name: 'timingClosure',
      desc: '',
      args: [],
    );
  }

  /// `sleepReminder`
  String get sleepReminder {
    return Intl.message(
      'sleepReminder',
      name: 'sleepReminder',
      desc: '',
      args: [],
    );
  }

  /// `darkSetting`
  String get darkSetting {
    return Intl.message(
      'darkSetting',
      name: 'darkSetting',
      desc: '',
      args: [],
    );
  }

  /// `feedback`
  String get feedback {
    return Intl.message(
      'feedback',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `about`
  String get about {
    return Intl.message(
      'about',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `cooperation`
  String get cooperation {
    return Intl.message(
      'cooperation',
      name: 'cooperation',
      desc: '',
      args: [],
    );
  }

  /// `userAgreement`
  String get userAgreement {
    return Intl.message(
      'userAgreement',
      name: 'userAgreement',
      desc: '',
      args: [],
    );
  }

  /// `privacyPolicy`
  String get privacyPolicy {
    return Intl.message(
      'privacyPolicy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `permission`
  String get permission {
    return Intl.message(
      'permission',
      name: 'permission',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
