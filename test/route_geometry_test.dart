import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:nexmile/features/catalogue/presentation/widgets/tracking/route_geometry.dart';

void main() {
  // An L-shaped route in Madurai: about 1.1 km north, then about 1.1 km east.
  const LatLng start = LatLng(9.9200, 78.1200);
  const LatLng corner = LatLng(9.9300, 78.1200);
  const LatLng end = LatLng(9.9300, 78.1300);
  final RoutePath path = RoutePath(const <LatLng>[start, corner, end]);

  group('distance and bearing', () {
    test('a hundredth of a degree of latitude is about 1.1 km', () {
      expect(distanceMetres(start, corner), closeTo(1112, 2));
    });

    test('bearings point the right way', () {
      expect(bearingDegrees(start, corner), closeTo(0, 0.01));
      expect(bearingDegrees(corner, end), closeTo(90, 0.1));
    });

    test('turning across north goes the short way round', () {
      // 350° to 10° is 20° clockwise, not 340° anticlockwise.
      expect(lerpBearing(350, 10, 0.5), closeTo(0, 0.001));
      expect(lerpBearing(10, 350, 0.5), closeTo(0, 0.001));
    });
  });

  group('route path', () {
    test('measures its own length', () {
      expect(path.length, closeTo(1112 + 1096, 5));
    });

    test('places a point along the road, round the corner', () {
      final LatLng p = path.pointAt(path.length - 100);
      // 100 m before the end is on the eastbound leg, on its latitude.
      expect(p.latitude, closeTo(corner.latitude, 1e-6));
      expect(p.longitude, lessThan(end.longitude));
    });

    test('projects a point near the road onto it', () {
      // 20 m east of the northbound leg, halfway up.
      const LatLng beside = LatLng(9.9250, 78.12018);
      final RouteFix fix = path.project(beside);

      expect(fix.offRouteMetres, closeTo(20, 2));
      expect(fix.along, closeTo(556, 5));
    });

    test('slicing keeps the corner, so the line still bends', () {
      final List<LatLng> rest = path.slice(500, path.length);

      expect(rest.first.latitude, greaterThan(start.latitude));
      expect(rest, contains(corner));
      expect(rest.last, end);
    });

    test('heading follows the leg the point is on', () {
      expect(path.bearingAt(200), closeTo(0, 0.01));
      expect(path.bearingAt(path.length - 200), closeTo(90, 0.1));
    });
  });

  test('the arc bows to one side and still ends on both points', () {
    final List<LatLng> arc = arcBetween(start, end);

    expect(arc.first, start);
    expect(arc.last.latitude, closeTo(end.latitude, 1e-9));
    expect(arc.last.longitude, closeTo(end.longitude, 1e-9));
    // The middle of the arc is off the straight chord.
    final LatLng middle = arc[arc.length ~/ 2];
    final LatLng chordMiddle = lerpLatLng(start, end, 0.5);
    expect(distanceMetres(middle, chordMiddle), greaterThan(100));
  });
}
