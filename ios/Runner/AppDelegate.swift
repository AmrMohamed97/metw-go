import Flutter
import UIKit
import CoreLocation
import FirebaseCore
import FirebaseDatabase

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate, CLLocationManagerDelegate {
  private var locationManager: CLLocationManager?
  private var driverId: String?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let locationChannel = FlutterMethodChannel(name: "com.metw_go/location_tracking",
                                              binaryMessenger: controller.binaryMessenger)
    
    locationChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        if call.method == "startTracking" {
            guard let args = call.arguments as? [String: Any],
                  let id = args["driverId"] as? String else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "driverId is required", details: nil))
                return
            }
            self.startTracking(driverId: id)
            result(nil)
        } else if call.method == "stopTracking" {
            self.stopTracking()
            result(nil)
        } else {
            result(FlutterMethodNotImplemented)
        }
    })

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func startTracking(driverId: String) {
      self.driverId = driverId
      if locationManager == nil {
          locationManager = CLLocationManager()
          locationManager?.delegate = self
          locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
          locationManager?.distanceFilter = 10
          locationManager?.allowsBackgroundLocationUpdates = true
          locationManager?.pausesLocationUpdatesAutomatically = false
          locationManager?.showsBackgroundLocationIndicator = true
      }
      locationManager?.requestAlwaysAuthorization()
      locationManager?.startUpdatingLocation()
  }

  private func stopTracking() {
      locationManager?.stopUpdatingLocation()
      if let id = self.driverId {
          Database.database().reference().child("drivers").child(id).child("status").setValue("offline")
      }
      self.driverId = nil
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      guard let location = locations.last, let id = driverId else { return }
      
      let updates: [String: Any] = [
          "location": [
              "lat": location.coordinate.latitude,
              "lng": location.coordinate.longitude
          ],
          "status": "online"
      ]
      
      Database.database().reference().child("drivers").child(id).updateChildValues(updates)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
  }
}

