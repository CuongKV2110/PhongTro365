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

  /// `Hello Everybody`
  String get hello {
    return Intl.message(
      'Hello Everybody',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `KieuVanCuong`
  String get kvc {
    return Intl.message(
      'KieuVanCuong',
      name: 'kvc',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get setting {
    return Intl.message(
      'Settings',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get support {
    return Intl.message(
      'Help & Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get username {
    return Intl.message(
      'Email',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `TimTro365`
  String get appname {
    return Intl.message(
      'TimTro365',
      name: 'appname',
      desc: '',
      args: [],
    );
  }

  /// `Difficulty finding a room. I will help you !`
  String get splash1 {
    return Intl.message(
      'Difficulty finding a room. I will help you !',
      name: 'splash1',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get fb_login {
    return Intl.message(
      'Login with Facebook',
      name: 'fb_login',
      desc: '',
      args: [],
    );
  }

  /// `Login with Gmail`
  String get gmail_login {
    return Intl.message(
      'Login with Gmail',
      name: 'gmail_login',
      desc: '',
      args: [],
    );
  }

  /// `Change information`
  String get change_info {
    return Intl.message(
      'Change information',
      name: 'change_info',
      desc: '',
      args: [],
    );
  }

  /// `My post`
  String get my_post {
    return Intl.message(
      'My post',
      name: 'my_post',
      desc: '',
      args: [],
    );
  }

  /// `Posts saved`
  String get saved {
    return Intl.message(
      'Posts saved',
      name: 'saved',
      desc: '',
      args: [],
    );
  }

  /// `App information`
  String get app_info {
    return Intl.message(
      'App information',
      name: 'app_info',
      desc: '',
      args: [],
    );
  }

  /// `ShareRoom`
  String get share_room {
    return Intl.message(
      'ShareRoom',
      name: 'share_room',
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
      Locale.fromSubtags(languageCode: 'vi'),
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
