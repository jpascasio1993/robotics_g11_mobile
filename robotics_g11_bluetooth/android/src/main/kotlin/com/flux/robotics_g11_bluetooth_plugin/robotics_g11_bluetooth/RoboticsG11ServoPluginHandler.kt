package com.flux.robotics_g11_bluetooth_plugin.robotics_g11_bluetooth

import android.annotation.SuppressLint
import android.bluetooth.BluetoothAdapter
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

class RoboticsG11ServoPluginHandler : MethodCallHandler {

    private val servoDelegate: RoboticsG11ServoDelegate = RoboticsG11ServoDelegate()

    @SuppressLint("LongLogTag")
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

        if (call.method == "runMotor") {
            Log.i("RoboticsG11ServoPluginHandler", "runMotor: ")
            servoDelegate.runMotor(call.arguments as Int)
            result.success(true)
        }

        if (call.method == "turnServo") {
            Log.i("RoboticsG11ServoPluginHandler", "turnServo: ")
            servoDelegate.turnServo(call.arguments as Int)
            result.success(true)
        }
    }
}