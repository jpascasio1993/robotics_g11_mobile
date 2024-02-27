package com.flux.robotics_g11_bluetooth_plugin.robotics_g11_bluetooth

import android.annotation.SuppressLint
import android.app.Activity
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.bluetooth.BluetoothSocket
import android.content.Intent
import android.util.Log
import androidx.core.app.ActivityCompat.startActivityForResult
import com.flux.robotics_g11_bluetooth_plugin.robotics_g11_bluetooth.extensions.isNull
import io.flutter.plugin.common.PluginRegistry
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.withContext
import java.io.IOException
import java.io.InputStream
import java.io.OutputStream
import java.util.UUID


class RoboticsG11BluetoothDelegate(private var btAdapter: BluetoothAdapter?) :
    PluginRegistry.ActivityResultListener {
   companion object {
       const val BT_ADDRESS: String = "98:DA:50:03:05:6E"
       val BT_UUID: UUID? = UUID
           .fromString("00001101-0000-1000-8000-00805F9B34FB")
   }
    private var btSocket: BluetoothSocket? = null
    private var btDevice: BluetoothDevice? = null
    private var outputStream: OutputStream? = null
    private var inputStream: InputStream? = null
    var isRunning = false
    var lastCommand = "500000"

    @SuppressLint("LongLogTag")
    @Throws(IOException::class)
    private suspend fun connect(): Boolean {
       return withContext(Dispatchers.IO) {

           btDevice = btAdapter?.bondedDevices?.toList()?.find { bluetoothDevice -> bluetoothDevice.address == BT_ADDRESS }
           if(btDevice.isNull()) throw IOException("Bluetooth device is null")
           btSocket = createBluetoothSocket(btDevice!!)
           btAdapter!!.cancelDiscovery()
           try {
               Log.i("RoboticsG11BluetoothDelegate","connecting to bluetooth... ${btDevice!!.address}")
               btSocket!!.connect()
               Log.i("RoboticsG11BluetoothDelegate","connected to bluetooth...")
               outputStream = btSocket!!.outputStream
               Log.i("RoboticsG11BluetoothDelegate","retrieved outputstream socket...")
               inputStream = btSocket!!.inputStream
               Log.i("RoboticsG11BluetoothDelegate","retrieved inputStream socket...")
//               listenToPairedDevice()
                return@withContext true
           } catch(exception: IOException) {
               btSocket?.close();
               Log.i("RoboticsG11BluetoothDelegate","failed to connect to bluetooth. Closing connection...")
               throw exception
           }
       }
    }

    fun disconnect() {
        btSocket?.close()
        btDevice = null
        btAdapter = null
    }

    @Throws(IOException::class)
    suspend fun sendCommand(command: String) {
        if(outputStream == null) return
//        if(isRunning) return
//        if(lastCommand == command) return
        lastCommand = command
//        isRunning = true

        Log.i("sendCommand", lastCommand)

        withContext(Dispatchers.IO) {
            val bytes: ByteArray = lastCommand.trim().toByteArray()
            outputStream!!.write(bytes)
            listenToPairedDevice()
            Log.i("executedCommand", lastCommand)
            outputStream!!.flush()
        }
//        isRunning = false
    }

    @SuppressLint("LongLogTag")
    suspend fun listenToPairedDevice() {
        withContext(Dispatchers.IO) {
            val buffer = ByteArray(256)
            val sb = StringBuilder()
            var bytes: Int
            Log.i("RoboticsG11BluetoothDelegate","listenToPairedDevice...")

            while (true) {
                try {
                    bytes = inputStream!!.read(buffer)
                    val strIncom = String(buffer, 0, bytes)
                    sb.append(strIncom)
                    Log.i("Arduino Data String", strIncom)
                    if (sb.toString() == "done") {
                        sb.delete(0, sb.length)
                        return@withContext
                    }
                } catch (e: IOException) {
                    Log.e("listen error", e.toString())
                    Log.e("Arduino Data String", "$sb CATCH")
                    return@withContext
                }
            }
        }
    }

    @SuppressLint("LongLogTag")
    @Throws(IOException::class)
    private fun createBluetoothSocket(device: BluetoothDevice): BluetoothSocket {
//        try {
//            val m = device.javaClass.getMethod(
//                "createInsecureRfcommSocketToServiceRecord",
//                *arrayOf<Class<*>>(UUID::class.java)
//            )
//            return m.invoke(device, BT_UUID) as BluetoothSocket
//        } catch (e: Exception) {
//            Log.e("RoboticsG11BluetoothDelegate", "Could not create Insecure RFComm Connection", e)
//        }
        return device.createRfcommSocketToServiceRecord(BT_UUID)
    }

    @SuppressLint("LongLogTag")
    fun checkBluetoothState(activity: Activity): Boolean {
        if (btAdapter.isNull()) {
            Log.d("RoboticsG11BluetoothDelegate", "bluetooth adapter is null");
            return false;
        }

        if (btAdapter!!.isEnabled) {
            return runBlocking {
                return@runBlocking connect()
            }
        }

        // Prompt user to turn on his bluetooth

        val enableBtIntent = Intent(
            BluetoothAdapter.ACTION_REQUEST_ENABLE
        )
        startActivityForResult(activity, enableBtIntent, 1, null)
        return false
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

