package com.flux.robotics_g11_bluetooth_plugin.robotics_g11_bluetooth

import android.annotation.SuppressLint
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.util.Log


/** RoboticsG11BluetoothPlugin */
class RoboticsG11BluetoothPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var activityPluginBinding: ActivityPluginBinding? = null
  private val servoHandler: RoboticsG11ServoPluginHandler = RoboticsG11ServoPluginHandler()
  private val bluetoothHandler: RoboticsG11BluetoothPluginHandler = RoboticsG11BluetoothPluginHandler()

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "robotics_g11_bluetooth")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    servoHandler.onMethodCall(call, result)
    bluetoothHandler.onMethodCall(call, result)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  @SuppressLint("LongLogTag")
  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    Log.i("RoboticsG11BluetoothPlugin", "onAttachedToActivity: ")
    activityPluginBinding = binding
    bluetoothHandler.onAttachedToActivity(binding)
  }

  @SuppressLint("LongLogTag")
  override fun onDetachedFromActivityForConfigChanges() {
    Log.i("RoboticsG11BluetoothPlugin", "onDetachedFromActivityForConfigChanges: ")
    activityPluginBinding = null
    bluetoothHandler.onDetachedFromActivityForConfigChanges()
  }

  @SuppressLint("LongLogTag")
  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    Log.i("RoboticsG11BluetoothPlugin", "onReattachedToActivityForConfigChanges: ")
    activityPluginBinding = binding
    bluetoothHandler.onReattachedToActivityForConfigChanges(binding)
  }

  @SuppressLint("LongLogTag")
  override fun onDetachedFromActivity() {
    Log.i("RoboticsG11BluetoothPlugin", "onDetachedFromActivity: ")
    activityPluginBinding = null
    bluetoothHandler.onDetachedFromActivity()
  }
}
