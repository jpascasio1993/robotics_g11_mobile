package com.flux.robotics_g11_bluetooth_plugin.robotics_g11_bluetooth

import android.annotation.SuppressLint
import android.util.Log

class RoboticsG11ServoDelegate {
    @SuppressLint("LongLogTag")
    fun runMotor(speed: Int) {
        Log.d("RoboticsG11BluetoothDelegate: runMotor", "Speed: $speed");
    }

    @SuppressLint("LongLogTag")
    fun turnServo(degree: Int) {
        Log.d("RoboticsG11BluetoothDelegate: turnServo", "degree: $degree");
    }
}