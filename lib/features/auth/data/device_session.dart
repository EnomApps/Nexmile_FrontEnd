import 'package:flutter/foundation.dart';

/// One device holding a live refresh token, from `GET /v1/auth/sessions`.
///
/// Every field except the id is nullable in the schema, so nothing here may be
/// assumed present — a session with no device name and no last-used time still
/// has to render as a revocable row.
@immutable
class DeviceSession {
  const DeviceSession({
    required this.id,
    this.deviceName,
    this.ipAddress,
    this.lastUsedAt,
    this.createdAt,
    this.expiresAt,
  });

  final int id;

  /// Sent by the app as `device_name` on verification, so the customer can
  /// recognise which phone a row refers to.
  final String? deviceName;

  final String? ipAddress;
  final DateTime? lastUsedAt;
  final DateTime? createdAt;
  final DateTime? expiresAt;

  static DeviceSession fromJson(Map<String, dynamic> json) => DeviceSession(
        id: json['id'] is int
            ? json['id'] as int
            : int.tryParse('${json['id']}') ?? 0,
        deviceName: json['device_name'] as String?,
        ipAddress: json['ip_address'] as String?,
        lastUsedAt: _date(json['last_used_at']),
        createdAt: _date(json['created_at']),
        expiresAt: _date(json['expires_at']),
      );

  static DateTime? _date(Object? raw) =>
      raw is String ? DateTime.tryParse(raw)?.toLocal() : null;
}
