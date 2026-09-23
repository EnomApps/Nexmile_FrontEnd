import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:geolocator/geolocator.dart';

/// Why a location request failed, as a closed set the UI can translate.
enum LocationFailure {
  /// The customer said no, but can be asked again.
  denied,

  /// "Don't ask again" on Android, or Settings-level denial on iOS. Only the
  /// system settings screen can undo this, so the UI must say so rather than
  /// re-prompting into a dialog that will never appear.
  deniedForever,

  /// Location is switched off device-wide.
  serviceDisabled,

  /// The fix timed out or the platform returned an error.
  unavailable,
}

@immutable
class LocationFix {
  const LocationFix({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;
}

/// A best-effort street address for a coordinate, used to prefill the form.
@immutable
class ResolvedPlace {
  const ResolvedPlace({
    this.line1,
    this.landmark,
    this.city,
    this.state,
    this.pincode,
  });

  final String? line1;
  final String? landmark;
  final String? city;
  final String? state;
  final String? pincode;

  bool get isEmpty =>
      (line1 ?? '').isEmpty &&
      (city ?? '').isEmpty &&
      (pincode ?? '').isEmpty;
}

/// Wraps geolocator and geocoding so the UI never touches the plugins, and so
/// tests can substitute a fake.
abstract class LocationService {
  /// Current permission state without prompting.
  Future<LocationPermission> currentPermission();

  /// Prompts if needed, then returns a fix. Throws [LocationFailure] cases via
  /// [LocationException].
  Future<LocationFix> requestFix();

  /// Reverse-geocodes a coordinate. Never throws — an unresolvable point just
  /// means the customer types the address themselves.
  Future<ResolvedPlace> describe(double latitude, double longitude);

  /// Opens the OS settings page so a "denied forever" customer can recover.
  Future<void> openSettings();
}

class LocationException implements Exception {
  const LocationException(this.failure);

  final LocationFailure failure;

  @override
  String toString() => 'LocationException(${failure.name})';
}

class GeolocatorLocationService implements LocationService {
  const GeolocatorLocationService();

  @override
  Future<LocationPermission> currentPermission() =>
      Geolocator.checkPermission();

  @override
  Future<LocationFix> requestFix() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw const LocationException(LocationFailure.serviceDisabled);
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      throw const LocationException(LocationFailure.deniedForever);
    }
    if (permission == LocationPermission.denied) {
      throw const LocationException(LocationFailure.denied);
    }

    try {
      final Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          // A delivery pin is worth waiting a few seconds for, but not
          // forever — the customer can always drag the pin instead.
          timeLimit: Duration(seconds: 20),
        ),
      );
      return LocationFix(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (_) {
      throw const LocationException(LocationFailure.unavailable);
    }
  }

  @override
  Future<ResolvedPlace> describe(double latitude, double longitude) async {
    try {
      // geocoding 5 replaced the top-level functions with an instance; the
      // instance is cheap and holds no platform resources between calls.
      final List<geo.Placemark> marks =
          await geo.Geocoding().placemarkFromCoordinates(latitude, longitude);
      if (marks.isEmpty) return const ResolvedPlace();

      final geo.Placemark mark = marks.first;
      // Indian placemarks put the useful street in `street`, the
      // neighbourhood in `subLocality` and the city in `locality`.
      final String line1 = <String?>[mark.name, mark.thoroughfare]
          .where((String? p) => p != null && p.trim().isNotEmpty)
          .toSet()
          .join(', ');

      return ResolvedPlace(
        line1: line1.isEmpty ? mark.street : line1,
        landmark: mark.subLocality,
        city: mark.locality?.isNotEmpty == true
            ? mark.locality
            : mark.subAdministrativeArea,
        state: mark.administrativeArea,
        pincode: mark.postalCode,
      );
    } catch (_) {
      // Geocoding is a convenience, never a requirement.
      return const ResolvedPlace();
    }
  }

  @override
  Future<void> openSettings() async {
    // App settings first: the usual cause is a per-app denial.
    final bool opened = await Geolocator.openAppSettings();
    if (!opened) await Geolocator.openLocationSettings();
  }
}
