import 'dart:convert';

import 'package:flutter/foundation.dart';

/// Request/response logging for the API client.
///
/// Debug builds only. Every method is a no-op behind [kDebugMode], so the tree
/// shaker removes the whole thing from a release build and no customer's token
/// or verification code can leak out of a shipped app.
///
/// Output goes through [debugPrint] rather than `dart:developer`, because
/// `developer.log` is delivered to the VM service and only reaches Android's
/// logcat when a debugger happens to be attached. `debugPrint` always lands
/// there under the `flutter` tag, which is what makes these lines visible in
/// Android Studio's Logcat window without `flutter run` holding the device.
/// Every line carries [_tag] so it can be filtered out of the framework noise.
class ApiLog {
  const ApiLog._();

  static const String _tag = 'nexmile.api';

  /// Bodies longer than this are truncated. Generous on purpose: the home
  /// payload is ~20 KB, and a cap that cuts it off hides exactly the sections
  /// worth inspecting. `debugPrint` chunks long output rather than dropping it.
  static const int _maxBody = 14000;

  /// Header and body fields that must never reach a log, even in debug: a
  /// bearer token pasted into a bug report is a working session.
  static const Set<String> _secretHeaders = <String>{
    'authorization',
    'cookie',
    'set-cookie',
  };
  static const Set<String> _secretFields = <String>{
    'code',
    'otp',
    'password',
    'token',
    'access_token',
    'refresh_token',
    'device_token',
  };

  static void request(
    String method,
    Uri uri,
    Map<String, String> headers,
    Object? body,
  ) {
    if (!kDebugMode) return;
    final StringBuffer out = StringBuffer('[$_tag] → $method ${uri.path}');
    if (uri.hasQuery) out.write('?${uri.query}');
    out.write('\n   headers: ${_redactHeaders(headers)}');
    if (body != null) out.write('\n   payload: ${_pretty(body)}');
    debugPrint(out.toString());
  }

  static void response(
    String method,
    Uri uri,
    int status,
    String body,
    Duration elapsed,
  ) {
    if (!kDebugMode) return;
    final String mark = status >= 200 && status < 300 ? '✓' : '✗';
    debugPrint(
      '[$_tag] ← $mark $status $method ${uri.path}'
      '  (${elapsed.inMilliseconds}ms)'
      '\n   response: ${_pretty(body)}',
    );
  }

  /// The request never reached the server, so there is no status to report.
  static void failure(String method, Uri uri, Object error) {
    if (!kDebugMode) return;
    debugPrint('[$_tag] ← ✗ $method ${uri.path}  $error');
  }

  static String _redactHeaders(Map<String, String> headers) {
    final Map<String, String> safe = <String, String>{
      for (final MapEntry<String, String> e in headers.entries)
        e.key: _secretHeaders.contains(e.key.toLowerCase())
            // Keep the shape so "was a token attached?" stays answerable.
            ? '<redacted ${e.value.length} chars>'
            : e.value,
    };
    return safe.toString();
  }

  /// Pretty-prints JSON, redacts secret fields, and truncates.
  static String _pretty(Object? body) {
    Object? decoded = body;
    if (body is String) {
      if (body.isEmpty) return '<empty>';
      try {
        decoded = jsonDecode(body);
      } on FormatException {
        // An HTML error page. Show the head of it — that is exactly the case
        // worth seeing, and it is why Accept: application/json matters.
        return _truncate(body);
      }
    }

    try {
      return _truncate(
        const JsonEncoder.withIndent('  ').convert(_redact(decoded)),
      );
    } catch (_) {
      return _truncate('$decoded');
    }
  }

  /// A single value long enough to push the rest of the payload past the cap.
  /// The presigned S3 URLs the API returns are ~1.5 KB each, so half a dozen
  /// banners were burying every section below them.
  static const int _maxValue = 180;

  static Object? _redact(Object? value) {
    if (value is Map) {
      return <String, Object?>{
        for (final MapEntry<Object?, Object?> e in value.entries)
          '${e.key}': _secretFields.contains('${e.key}'.toLowerCase())
              ? '<redacted>'
              : _redact(e.value),
      };
    }
    if (value is List) return value.map(_redact).toList();
    if (value is String && value.length > _maxValue) {
      // Keep the head: enough to tell an S3 banner from an S3 logo, and to
      // paste into a browser after finding the rest in the network tab.
      return '${value.substring(0, _maxValue)}… (${value.length} chars)';
    }
    return value;
  }

  static String _truncate(String text) => text.length <= _maxBody
      ? text
      : '${text.substring(0, _maxBody)}\n   … ${text.length - _maxBody} more chars';
}
