import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tm_aaaa_method_channel.dart';

abstract class TmAaaaPlatform extends PlatformInterface {
  /// Constructs a TmAaaaPlatform.
  TmAaaaPlatform() : super(token: _token);

  static final Object _token = Object();

  static TmAaaaPlatform _instance = MethodChannelTmAaaa();

  /// The default instance of [TmAaaaPlatform] to use.
  ///
  /// Defaults to [MethodChannelTmAaaa].
  static TmAaaaPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TmAaaaPlatform] when
  /// they register themselves.
  static set instance(TmAaaaPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
