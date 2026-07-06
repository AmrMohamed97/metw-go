package com.evyx.metw_go

import android.content.Context
import android.content.Intent
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import androidx.core.content.edit

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.metw_go/location_tracking"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "startTracking" -> {
                    val driverId = call.argument<String>("driverId")
                    if (driverId != null) {
                        // Save to SharedPreferences for BootReceiver
                        val prefs = getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
                        prefs.edit { putString("flutter.driverId", driverId) }

                        // Start Service
                        val serviceIntent = Intent(this, LocationTrackingService::class.java).apply {
                            putExtra("driverId", driverId)
                        }
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                            startForegroundService(serviceIntent)
                        } else {
                            startService(serviceIntent)
                        }
                        result.success(null)
                    } else {
                        result.error("INVALID_ARGUMENT", "driverId is null", null)
                    }
                }
                "stopTracking" -> {
                    // Clear SharedPreferences
                    val prefs = getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
                    prefs.edit { remove("flutter.driverId") }

                    // Stop Service
                    val serviceIntent = Intent(this, LocationTrackingService::class.java)
                    stopService(serviceIntent)
                    result.success(null)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}

