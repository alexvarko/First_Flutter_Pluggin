import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_info_plugin_platform_interface.dart';

class MethodChannelDeviceInfoPlugin extends DeviceInfoPluginPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('device_info_plugin');

  @override
  Future<String?> getDeviceInfo() async {
    final version = await methodChannel.invokeMethod<String>('getDeviceInfo');
    return version;
  }
}
