import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MegaThemes {
  static final megaLight = MegaThemeData.light();
  static final megaDark = MegaThemeData.dark();
}

class MegaThemeData with Diagnosticable {
  factory MegaThemeData({Brightness? brightness}) {
    final Brightness _brightness = brightness ?? Brightness.light;
    return MegaThemeData.raw(brightness: _brightness);
  }

  const MegaThemeData.raw({required this.brightness});

  factory MegaThemeData.light() => MegaThemeData(brightness: Brightness.light);

  factory MegaThemeData.dark() => MegaThemeData(brightness: Brightness.dark);

  final Brightness brightness;

  static MegaThemeData lerp(MegaThemeData a, MegaThemeData b, double t) {
    return MegaThemeData.raw(brightness: t < 0.5 ? a.brightness : b.brightness);
  }

  MegaThemeData copyWith({Brightness? brightness}) {
    return MegaThemeData.raw(brightness: brightness ?? this.brightness);
  }
}
