import 'package:flutter/foundation.dart';

class AdupterPalteformsServices {
  static bool isMobile() {
    return kIsWeb ? false : true;
  }
}
