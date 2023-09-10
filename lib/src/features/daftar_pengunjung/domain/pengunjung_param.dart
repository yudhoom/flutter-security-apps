import 'enum_pengunjung.dart';

class PengunjungParam {
  final EnumTypePengunjung? visitorType;
  final String? username;
  final String? idEvent;
  final String? idManifest;
  final String? routeName;

  PengunjungParam({
    this.visitorType,
    this.username,
    this.idEvent,
    this.idManifest,
    this.routeName,
  });
}
