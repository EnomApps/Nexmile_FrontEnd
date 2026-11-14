/// The tracking map's dark-mode style.
///
/// Light mode uses Google's standard map, which is what customers read their
/// own street on. Google's dark rendering is busy with shop pins and brand
/// colours, so in dark mode those are quietened and the route and the rider
/// are what the eye lands on. Street names stay, because "he's on Anna Salai"
/// is what people actually say.
const String kTrackingMapStyleDark = '''
[
  {"elementType":"geometry","stylers":[{"color":"#1b1e19"}]},
  {"elementType":"labels.icon","stylers":[{"visibility":"off"}]},
  {"elementType":"labels.text.fill","stylers":[{"color":"#8d9387"}]},
  {"elementType":"labels.text.stroke","stylers":[{"color":"#1b1e19"}]},
  {"featureType":"administrative.land_parcel","stylers":[{"visibility":"off"}]},
  {"featureType":"poi","stylers":[{"visibility":"off"}]},
  {"featureType":"poi.park","elementType":"geometry","stylers":[{"visibility":"on"},{"color":"#22301b"}]},
  {"featureType":"road","elementType":"geometry","stylers":[{"color":"#2c3128"}]},
  {"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#353b30"}]},
  {"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#4a4234"}]},
  {"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#6b7166"}]},
  {"featureType":"transit","stylers":[{"visibility":"off"}]},
  {"featureType":"water","elementType":"geometry","stylers":[{"color":"#10202a"}]}
]
''';
