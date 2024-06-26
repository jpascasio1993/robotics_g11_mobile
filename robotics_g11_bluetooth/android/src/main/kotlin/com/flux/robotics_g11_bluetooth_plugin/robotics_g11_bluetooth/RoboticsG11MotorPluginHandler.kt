package com.flux.robotics_g11_bluetooth_plugin.robotics_g11_bluetooth

import android.annotation.SuppressLint
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.withContext

class RoboticsG11MotorPluginHandler : MethodCallHandler {

    private val motorDelegate: RoboticsG11MotorDelegate = RoboticsG11MotorDelegate()
    private lateinit var bluetoothDelegate: RoboticsG11BluetoothDelegate

    fun setBluetoothDelegate(bluetoothDelegate: RoboticsG11BluetoothDelegate) {
        this.bluetoothDelegate = bluetoothDelegate;
    }

    @SuppressLint("LongLogTag")
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

        if (call.method == "runMotorForward") {
            Log.i("RoboticsG11ServoPluginHandler", "runMotorForward: ")
            val command = motorDelegate.runMotorForward(call.arguments as Int)
            CoroutineScope(Dispatchers.IO).launch {
                bluetoothDelegate.sendCommand(command)
            }
            result.success(command)
        }

        if (call.method == "runMotorBackward") {
            Log.i("RoboticsG11ServoPluginHandler", "runMotorBackward: ")
            val command = motorDelegate.runMotorBackward(call.arguments as Int)
            CoroutineScope(Dispatchers.IO).launch {
                bluetoothDelegate.sendCommand(command)
            }
            result.success(command)
        }

        if (call.method == "turnLeft") {
            Log.i("RoboticsG11ServoPluginHandler", "turnLeft: ")
            val command = motorDelegate.turnLeft(call.arguments as Int)
            CoroutineScope(Dispatchers.IO).launch {
                bluetoothDelegate.sendCommand(command)
            }
            result.success(command)
        }

        if (call.method == "turnRight") {
            Log.i("RoboticsG11ServoPluginHandler", "turnRight: ")
            val command = motorDelegate.turnRight(call.arguments as Int)
            CoroutineScope(Dispatchers.IO).launch {
                bluetoothDelegate.sendCommand(command)
            }
            result.success(command)
        }

        if (call.method == "customCommand") {
            val command = call.arguments as String
            CoroutineScope(Dispatchers.IO).launch {
                bluetoothDelegate.sendCommand(command)
            }
            result.success(command)
        }
    }
}