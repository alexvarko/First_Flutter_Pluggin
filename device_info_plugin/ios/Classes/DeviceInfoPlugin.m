#import "DeviceInfoPlugin.h"
#if __has_include(<device_info_plugin/device_info_plugin-Swift.h>)
#import <device_info_plugin/device_info_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "device_info_plugin-Swift.h"
#endif

@implementation DeviceInfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDeviceInfoPlugin registerWithRegistrar:registrar];
}
@end
