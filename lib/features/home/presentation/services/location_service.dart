import 'package:location/location.dart';

class LocationService {
  Location location = Location();
  Future<bool> checkAndRequestLocationService() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      return serviceEnabled == true;
    }
    return true;
  }

  Future<bool> checkAndRequestPermission() async {
    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      return false;
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      return permissionStatus == PermissionStatus.granted;
    }
    return true;
  }

  void getCurrentLocation(void Function(LocationData)? onData) {
    location.changeSettings(distanceFilter: 1);
    location.onLocationChanged.listen(onData);
  }

  void getMyLocation(void Function(LocationData)? onData) {
    location.getLocation();
  }
}
