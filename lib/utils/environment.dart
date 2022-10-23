import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get apiUrl => kReleaseMode
      ? dotenv.env['API_RELEASE_URL'] ?? 'MY_FALLBACK'
      : dotenv.env['API_URL'] ?? 'MY_FALLBACK';
  static String get authUrl => dotenv.env['AUTH_RELEASE_URL'] ?? 'MY_FALLBACK';
  static String get formioUrl => dotenv.env['FORMIO_URL'] ?? 'MY_FALLBACK';
  static String get redirectUrl => kReleaseMode
      ? dotenv.env['REDIRECT_URL_RELEASE'] ?? 'MY_FALLBACK'
      : dotenv.env['REDIRECT_URL'] ?? 'MY_FALLBACK';
  static String get servicesUrl => dotenv.env['SERVICES_URL'] ?? 'MY_FALLBACK';
}
