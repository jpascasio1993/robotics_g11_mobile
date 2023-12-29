package com.flux.robotics_g11_bluetooth_plugin.robotics_g11_bluetooth

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

class RoboticsG11BluetoothPluginHandler: MethodCallHandler {

    private val delegate: RoboticsG11BluetoothDelegate = RoboticsG11BluetoothDelegate();

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result){
        if(call.method == "runMotor") {
            delegate.runMotor(call.arguments as Int);
            result.success(true)
        }

        if(call.method == "turnServo") {
            delegate.turnServo(call.arguments as Int);
            result.success(true);
        }
    }
}