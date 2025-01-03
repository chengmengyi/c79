import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tm_aaaa_platform_interface.dart';

/// An implementation of [TmAaaaPlatform] that uses method channels.
class MethodChannelTmAaaa extends TmAaaaPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tm_aaaa');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
