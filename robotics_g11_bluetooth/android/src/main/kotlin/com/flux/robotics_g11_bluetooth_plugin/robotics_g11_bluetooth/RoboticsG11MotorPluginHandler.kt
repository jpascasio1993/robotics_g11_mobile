package com.flux.robotics_g11_bluetooth_plugin.robotics_g11_bluetooth

import android.annotation.SuppressLint
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

class RoboticsG11MotorPluginHandler : MethodCallHandler {

    private val servoDelegate: RoboticsG11MotorDelegate = RoboticsG11MotorDelegate()
    private lateinit var bluetoothDelegate: RoboticsG11BluetoothDelegate

    fun setBluetoothDelegate(bluetoothDelegate: RoboticsG11BluetoothDelegate) {
        this.bluetoothDelegate = bluetoothDelegate;
    }

    @SuppressLint("LongLogTag")
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

        if (call.method == "runMotorForward") {
            Log.i("RoboticsG11ServoPluginHandler", "runMotorForward: ")
            val command = servoDelegate.runMotorForward(call.arguments as Int)
            this.bluetoothDelegate.sendCommand(command)
            result.success(command)
        }

        if (call.method == "runMotorBackward") {
            Log.i("RoboticsG11ServoPluginHandler", "runMotorBackward: ")
            val command = servoDelegate.runMotorBackward(call.arguments as Int)
            this.bluetoothDelegate.sendCommand(command);
            result.success(command)
        }

        if (call.method == "turnLeft") {
            Log.i("RoboticsG11ServoPluginHandler", "turnLeft: ")
            val command = servoDelegate.turnLeft(call.arguments as Int)
            this.bluetoothDelegate.sendCommand(command);
            result.success(command)
        }

        if (call.method == "turnRight") {
            Log.i("RoboticsG11ServoPluginHandler", "turnRight: ")
            val command = servoDelegate.turnRight(call.arguments as Int)
            this.bluetoothDelegate.sendCommand(command);
            result.success(command)
        }
    }
}