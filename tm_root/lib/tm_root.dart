
import 'tm_root_platform_interface.dart';

class TmRoot {
  Future<String?> getPlatformVersion() {
    return TmRootPlatform.instance.getPlatformVersion();
  }
}
