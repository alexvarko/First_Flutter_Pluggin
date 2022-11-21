package com.example.device_info_plugin

import androidx.annotation.NonNull

import android.annotation.SuppressLint
import android.os.Build
import android.os.Bundle
import android.provider.Settings
import android.widget.TextView
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.util.DisplayMetrics







/** DeviceInfoPlugin */
class DeviceInfoPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "device_info_plugin")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {

    if (call.method == "getDeviceInfo") {
      result.success("Brand: ${android.os.Build.BRAND} \n" +
              "Device: ${android.os.Build.DEVICE} \n" +
              "CPU: ${android.os.Build.CPU_ABI} \n" +
              "Model: ${android.os.Build.MODEL} \n" +
              "ID: ${android.os.Build.ID} \n" +
              "SDK: ${android.os.Build.VERSION.SDK_INT} \n" +
              "Brand: ${android.os.Build.BRAND} \n" +
              "User: ${android.os.Build.USER} \n" +
              "Type: ${android.os.Build.TYPE} \n" +
              "Base: ${android.os.Build.VERSION_CODES.BASE} \n" +
              "Incremental: ${android.os.Build.VERSION.INCREMENTAL} \n" +
              "Board: ${android.os.Build.BOARD} \n" +
              "Host: ${android.os.Build.HOST} \n" +
              "FingerPrint: ${android.os.Build.FINGERPRINT} \n" +
              "Version Code: ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
