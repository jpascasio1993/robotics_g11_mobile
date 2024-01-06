package com.flux.robotics_g11_bluetooth_plugin.robotics_g11_bluetooth

import android.annotation.SuppressLint
import android.bluetooth.BluetoothAdapter
import android.util.Log
import com.flux.robotics_g11_bluetooth_plugin.robotics_g11_bluetooth.extensions.isNull
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

class RoboticsG11BluetoothPluginHandler : MethodCallHandler, ActivityAware {

    var bluetoothDelegate: RoboticsG11BluetoothDelegate =
        RoboticsG11BluetoothDelegate(BluetoothAdapter.getDefaultAdapter())
        private set

    private var activityPluginBinding: ActivityPluginBinding? = null

    @SuppressLint("LongLogTag")
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if(activityPluginBinding?.activity.isNull()) {
            Log.d("RoboticsG11BluetoothPluginHandler", "activity is null: ")
            return
        }

        if (call.method == "checkBluetoothState") {
            Log.i("RoboticsG11BluetoothPluginHandler", "checkBluetoothState: ")
            val res = bluetoothDelegate.checkBluetoothState(activityPluginBinding!!.activity)
            result.success(res)
        }

        if(call.method == "bluetoothDispose") {
            bluetoothDelegate.disconnect()
            result.success(true)
        }

    }

    @SuppressLint("LongLogTag")
    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        Log.i("RoboticsG11BluetoothPluginHandler", "onAttachedToActivity: ")
        activityPluginBinding = binding
    }

    @SuppressLint("LongLogTag")
    override fun onDetachedFromActivityForConfigChanges() {
        Log.i("RoboticsG11BluetoothPluginHandler", "onDetachedFromActivityForConfigChanges: ")
        activityPluginBinding = null
    }

    @SuppressLint("LongLogTag")
    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        Log.i("RoboticsG11BluetoothPluginHandler", "onReattachedToActivityForConfigChanges: ")
        activityPluginBinding = binding
    }

    @SuppressLint("LongLogTag")
    override fun onDetachedFromActivity() {
        Log.i("RoboticsG11BluetoothPluginHandler", "onDetachedFromActivity: ")
        activityPluginBinding = null
    }
}