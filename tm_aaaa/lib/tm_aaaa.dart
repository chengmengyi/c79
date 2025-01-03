
import 'tm_aaaa_platform_interface.dart';

class TmAaaa {
  Future<String?> getPlatformVersion() {
    return TmAaaaPlatform.instance.getPlatformVersion();
  }
}
