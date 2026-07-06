package com.evyx.metw_go

import android.annotation.SuppressLint
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import android.os.Looper
import android.util.Log
import androidx.core.app.NotificationCompat
import com.google.android.gms.location.*
import com.google.firebase.database.FirebaseDatabase

class LocationTrackingService : Service() {

    private lateinit var fusedLocationClient: FusedLocationProviderClient
    private lateinit var locationCallback: LocationCallback
    private val database = FirebaseDatabase.getInstance("https://new-lasco-default-rtdb.asia-southeast1.firebasedatabase.app")
    private var driverId: String? = null

    companion object {
        private const val CHANNEL_ID = "location_tracking_channel"
        private const val NOTIFICATION_ID = 12345
        private const val TAG = "LocationTrackingService"
    }

    override fun onCreate() {
        super.onCreate()
        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this)
        createNotificationChannel()

        locationCallback = object : LocationCallback() {
            override fun onLocationResult(locationResult: LocationResult) {
                locationResult.lastLocation?.let { location ->
                    driverId?.let { id ->
                        val locationMap = mapOf(
                            "lat" to location.latitude,
                            "lng" to location.longitude
                        )
                        val updates = mapOf(
                            "location" to locationMap,
                            "status" to "online"
                        )
                        database.reference.child("drivers").child(id).updateChildren(updates)
                            .addOnSuccessListener {
                                Log.d(TAG, "Location updated successfully for driver: $id")
                            }
                            .addOnFailureListener { e ->
                                Log.e(TAG, "Failed to update location", e)
                            }
                    }
                }
            }
        }
    }

    @SuppressLint("MissingPermission")
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        val id = intent?.getStringExtra("driverId")
        if (id != null) {
            driverId = id
            val notification = createNotification()
            startForeground(NOTIFICATION_ID, notification)
            
            // Update status immediately to online
            database.reference.child("drivers").child(id).child("status").setValue("online")
            fusedLocationClient.lastLocation.addOnSuccessListener { location ->
                if (location != null) {
                    val locationMap = mapOf(
                        "lat" to location.latitude,
                        "lng" to location.longitude
                    )
                    database.reference.child("drivers").child(id).child("location").setValue(locationMap)
                }
            }
            
            startLocationUpdates()
        } else {
            stopSelf()
        }
        return START_STICKY
    }

    @SuppressLint("MissingPermission")
    private fun startLocationUpdates() {
        val locationRequest = LocationRequest.Builder(Priority.PRIORITY_HIGH_ACCURACY, 10000)
            .setMinUpdateDistanceMeters(10f)
            .build()

        fusedLocationClient.requestLocationUpdates(
            locationRequest,
            locationCallback,
            Looper.getMainLooper()
        )
    }

    override fun onDestroy() {
        super.onDestroy()
        fusedLocationClient.removeLocationUpdates(locationCallback)
        
        driverId?.let { id ->
            database.reference.child("drivers").child(id).child("status").setValue("offline")
        }
    }

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                "Location Tracking Service",
                NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = "Running in background to track location"
            }
            val manager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            manager.createNotificationChannel(channel)
        }
    }

    private fun createNotification(): Notification {
        return NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("التتبع نشط")
            .setContentText("يتم تحديث موقعك الآن لضمان وصول الطلبات بدقة")
            .setSmallIcon(android.R.drawable.ic_menu_mylocation)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .build()
    }
}
