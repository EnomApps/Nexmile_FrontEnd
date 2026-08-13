import 'package:flutter/foundation.dart';

/// The three labels the API accepts.
enum AddressLabel { home, work, other }

/// A saved delivery address, mirroring `AddressResource`.
///
/// Note the asymmetry in the API: latitude and longitude are **sent** as JSON
/// numbers but **returned** as strings. [fromJson] tolerates either.
@immutable
class Address {
  const Address({
    required this.id,
    required this.label,
    required this.line1,
    required this.city,
    required this.state,
    required this.pincode,
    required this.latitude,
    required this.longitude,
    required this.isDefault,
    this.contactName,
    this.contactPhone,
    this.line2,
    this.landmark,
  });

  final int id;
  final AddressLabel label;
  final String? contactName;
  final String? contactPhone;
  final String line1;
  final String? line2;
  final String? landmark;
  final String city;
  final String state;
  final String pincode;
  final double latitude;
  final double longitude;
  final bool isDefault;

  /// Single-line rendering for a list row.
  String get summary => <String?>[line1, line2, landmark, city, pincode]
      .where((String? part) => part != null && part.trim().isNotEmpty)
      .join(', ');

  static Address fromJson(Map<String, dynamic> json) => Address(
        id: _int(json['id']),
        label: labelFrom(json['label'] as String?),
        contactName: json['contact_name'] as String?,
        contactPhone: json['contact_phone'] as String?,
        line1: json['line1'] as String? ?? '',
        line2: json['line2'] as String?,
        landmark: json['landmark'] as String?,
        city: json['city'] as String? ?? '',
        state: json['state'] as String? ?? '',
        pincode: json['pincode'] as String? ?? '',
        latitude: _double(json['latitude']),
        longitude: _double(json['longitude']),
        isDefault: json['is_default'] as bool? ?? false,
      );

  static AddressLabel labelFrom(String? raw) {
    for (final AddressLabel value in AddressLabel.values) {
      if (value.name == raw) return value;
    }
    return AddressLabel.other;
  }

  static int _int(Object? raw) =>
      raw is int ? raw : int.tryParse('$raw') ?? 0;

  static double _double(Object? raw) {
    if (raw is double) return raw;
    if (raw is int) return raw.toDouble();
    return double.tryParse('$raw') ?? 0;
  }

  @override
  bool operator ==(Object other) => other is Address && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// Body for creating or updating an address.
///
/// Kept separate from [Address] because the request and the resource genuinely
/// differ: no id, and coordinates go out as numbers.
@immutable
class AddressDraft {
  const AddressDraft({
    required this.label,
    required this.line1,
    required this.city,
    required this.state,
    required this.pincode,
    required this.latitude,
    required this.longitude,
    this.contactName,
    this.contactPhone,
    this.line2,
    this.landmark,
    this.isDefault = false,
  });

  final AddressLabel label;
  final String? contactName;
  final String? contactPhone;
  final String line1;
  final String? line2;
  final String? landmark;
  final String city;
  final String state;
  final String pincode;
  final double latitude;
  final double longitude;
  final bool isDefault;

  /// Null-valued optional fields are dropped by `ApiClient` before encoding,
  /// so an empty landmark is simply absent rather than sent as null.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'label': label.name,
        'contact_name': _orNull(contactName),
        'contact_phone': _orNull(contactPhone),
        'line1': line1.trim(),
        'line2': _orNull(line2),
        'landmark': _orNull(landmark),
        'city': city.trim(),
        'state': state.trim(),
        'pincode': pincode.trim(),
        'latitude': latitude,
        'longitude': longitude,
        'is_default': isDefault,
      };

  static String? _orNull(String? value) {
    final String trimmed = value?.trim() ?? '';
    return trimmed.isEmpty ? null : trimmed;
  }
}
