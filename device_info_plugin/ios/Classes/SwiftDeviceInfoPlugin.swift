import Flutter
import UIKit

public class SwiftDeviceInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_info_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftDeviceInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS: " + UIDevice.current.systemVersion + "\n" +
            "Device Name: " + UIDevice.current.name + "\n" +
            "System Name: " + UIDevice.current.systemName + "\n" +
            "Model: " + UIDevice.current.model + "\n" +
            "Localized model" + UIDevice.current.localizedModel + "\n" +
            "User Interface Idiom: " + UIDevice.current.userInterfaceIdiom + "\n" +
            "Battery Level: " + UIDevice.current.batteryLevel)
  }
}
