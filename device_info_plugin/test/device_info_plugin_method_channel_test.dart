import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_info_plugin/device_info_plugin_method_channel.dart';

void main() {
  MethodChannelDeviceInfoPlugin platform = MethodChannelDeviceInfoPlugin();
  const MethodChannel channel = MethodChannel('device_info_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getDeviceInfo', () async {
    expect(await platform.getDeviceInfo(), '42');
  });
}
