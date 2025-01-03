import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tm_root_platform_interface.dart';

/// An implementation of [TmRootPlatform] that uses method channels.
class MethodChannelTmRoot extends TmRootPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tm_root');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
