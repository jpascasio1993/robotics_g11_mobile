package com.flux.robotics_g11_bluetooth_plugin.robotics_g11_bluetooth

import android.annotation.SuppressLint
import android.app.Activity
import android.bluetooth.BluetoothAdapter
import android.content.Intent
import android.util.Log
import androidx.core.app.ActivityCompat.startActivityForResult
import com.flux.robotics_g11_bluetooth_plugin.robotics_g11_bluetooth.extensions.isNull
import io.flutter.plugin.common.PluginRegistry


class RoboticsG11BluetoothDelegate(private val bluetoothAdapter: BluetoothAdapter?) :
    PluginRegistry.ActivityResultListener {
    @SuppressLint("LongLogTag")
    fun checkBluetoothState(activity: Activity): Boolean {
        if (bluetoothAdapter.isNull()) {
            Log.d("RoboticsG11BluetoothDelegate", "bluetooth adapter is null");
            return false;
        }

        if (bluetoothAdapter!!.isEnabled) {
            // TODO: run bluetoothTask
            // new BluetoothTask(savedInstanceStateBundle).execute();
            return true;
        }

        // Prompt user to turn on his bluetooth

        val enableBtIntent = Intent(
            BluetoothAdapter.ACTION_REQUEST_ENABLE
        )
        startActivityForResult(activity, enableBtIntent, 1, null)
        return false;
    }

    @SuppressLint("LongLogTag")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        Log.d("RoboticsG11BluetoothDelegate", "onActivityResult $resultCode")
        if (requestCode == 1) {
            if (resultCode == Activity.RESULT_OK) {

                // TODO: run bluetoothTask
                // new BluetoothTask(savedInstanceStateBundle).execute();
                return true
            }
        }
        return false;
    }
}

