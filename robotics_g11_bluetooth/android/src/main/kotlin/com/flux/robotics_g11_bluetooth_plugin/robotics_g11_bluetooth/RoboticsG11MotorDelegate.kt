package com.flux.robotics_g11_bluetooth_plugin.robotics_g11_bluetooth

import android.annotation.SuppressLint
import android.util.Log

class RoboticsG11MotorDelegate {
    companion object {
        const val RUN_MOTOR_FORWARD_CODE = 50
        const val RUN_MOTOR_BACKWARD_CODE = 51
        const val DIRECTION_LEFT_CODE = 1
        const val DIRECTION_RIGHT_CODE = 2
    }
    @SuppressLint("LongLogTag")
    fun runMotorForward(speed: Int): String {
        Log.d("RoboticsG11BluetoothDelegate: runMotorForward", "Speed: $speed");
        return "$RUN_MOTOR_FORWARD_CODE$speed"
    }

    @SuppressLint("LongLogTag")
    fun runMotorBackward(speed: Int): String {
        Log.d("RoboticsG11BluetoothDelegate: runMotorBackward", "Speed: $speed");
        return "$RUN_MOTOR_BACKWARD_CODE$speed"
    }

    @SuppressLint("LongLogTag")
    fun turnLeft(speed: Int): String {
        Log.d("RoboticsG11BluetoothDelegate: turnLeft", "Speed: $speed");
        return "$DIRECTION_LEFT_CODE$speed"
    }

    @SuppressLint("LongLogTag")
    fun turnRight(speed: Int): String {
        Log.d("RoboticsG11BluetoothDelegate: turnLeft", "Speed: $speed");
        return "$DIRECTION_RIGHT_CODE$speed"
    }
}