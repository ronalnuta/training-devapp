import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'dart:developer' as developer;

class LoggerHelper {
  /* 
    - AnsiColor docs: https://en.wikipedia.org/wiki/ANSI_escape_code
    - Emoji:
      + Mac: Control + Command + Space. 
      + Windows: "Windows key" + ; (semicolon).
    */
  static final Logger log = Logger();

  // navigation
  static void navigator(String text) {
    AnsiColor color = AnsiColor.fg(129);
    final value = color(' 🚺 $text');
    kReleaseMode
        ? log.i(value)
        : developer.log(
            value,
            name: "navigator",
          );
  }

  // bloc
  static void errorBloc(
    String text,
    Object error,
    StackTrace stackTrace,
  ) {
    AnsiColor color = AnsiColor.fg(196);
    final value = color(' ❌ Error in : $text');
    kReleaseMode
        ? log.e(
            value,
            error,
            stackTrace,
          )
        : developer.log(
            value,
            name: "errorBloc",
            error: error,
            stackTrace: stackTrace,
          );
  }

  static void closeBloc(String text) {
    AnsiColor color = AnsiColor.fg(208);
    final value = color(' 🚼 Close $text');
    kReleaseMode
        ? log.i(value)
        : developer.log(
            value,
            name: "closeBloc",
          );
  }

  static void createBloc(String text) {
    AnsiColor color = AnsiColor.fg(82);
    final value = color(' 🍀 Create $text');
    kReleaseMode
        ? log.i(value)
        : developer.log(
            value,
            name: "createBloc",
          );
  }

  static void changedBloc({
    required String text,
    required String current,
    required String next,
  }) {
    AnsiColor color = AnsiColor.fg(219);
    AnsiColor colorFrom = AnsiColor.fg(249);
    AnsiColor colorTo = AnsiColor.fg(255);
    final value = (color(' 💖 onChange $text\n') +
        colorFrom('From: $current\n') +
        colorTo('To: $next'));
    kReleaseMode
        ? log.i(value)
        : developer.log(
            value,
            name: "changedBloc",
          );
  }

  static void transitionBloc(String text) {
    AnsiColor color = AnsiColor.fg(130);
    final value = color(' 🧡 onTransition $text');
    kReleaseMode
        ? log.i(value)
        : developer.log(
            value,
            name: "transitionBloc",
          );
  }

  static void eventBloc(String text) {
    AnsiColor color = AnsiColor.fg(89);
    final value = color(' 🦄 onEvent $text');
    kReleaseMode
        ? log.i(value)
        : developer.log(
            value,
            name: "eventBloc",
          );
  }

  // api
  static void errorApi(String text) {
    AnsiColor color = AnsiColor.fg(160);
    final value = color(' ⛔️ $text');
    kReleaseMode
        ? log.e(value)
        : developer.log(
            value,
            name: "errorApi",
          );
  }

  static void successApi(String text) {
    AnsiColor color = AnsiColor.fg(40);
    final value = color(' ✅ $text');
    kReleaseMode
        ? log.i(value)
        : developer.log(
            value,
            name: "successApi",
          );
  }

  // func
  static void error(String text) {
    AnsiColor color = AnsiColor.fg(160);
    final value = color(' 🅾️ $text');
    kReleaseMode
        ? log.e(value)
        : developer.log(
            value,
            name: "error",
          );
  }
}
