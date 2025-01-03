import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tm_root_method_channel.dart';

abstract class TmRootPlatform extends PlatformInterface {
  /// Constructs a TmRootPlatform.
  TmRootPlatform() : super(token: _token);

  static final Object _token = Object();

  static TmRootPlatform _instance = MethodChannelTmRoot();

  /// The default instance of [TmRootPlatform] to use.
  ///
  /// Defaults to [MethodChannelTmRoot].
  static TmRootPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TmRootPlatform] when
  /// they register themselves.
  static set instance(TmRootPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
