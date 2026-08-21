import 'package:metw_go/core/models/order_action_response/order_action_response.dart';
import 'package:metw_go/core/models/start_order_response/start_order_response.dart';

abstract class AppState {}

class AppInitial extends AppState {}

//-----------------------------Home_Status--------------------------------------
class HomeStatusLoading extends AppState {}

class HomeStatusChanged extends AppState {
  final String status;
  HomeStatusChanged(this.status);
}

class HomeStatusError extends AppState {
  final String error;
  HomeStatusError(this.error);
}
//------------------------------------------------------------------------------

class ChangeLanguageState extends AppState {}

class ChangeThemeState extends AppState {}

class ApplogoutLoadingState extends AppState {}

class ApplogoutLogoutSuccessState extends AppState {}

class ApplogoutErrorState extends AppState {
  final String message;

  ApplogoutErrorState(this.message);
}

//-----------------------------Order_Actions-------------------------------------
// Start Order
class AcceptStartOrderLoadingState extends AppState {}

class AcceptStartOrderSuccessState extends AppState {
  final StartOrderResponse response;
  AcceptStartOrderSuccessState(this.response);
}

class AcceptStartOrderErrorState extends AppState {
  final String message;
  AcceptStartOrderErrorState(this.message);
}

// Arrive Pickup Order
class ArriveAtPickupOrderLoadingState extends AppState {}

class ArriveAtPickupOrderSuccessState extends AppState {
  final OrderActionResponse response;
  ArriveAtPickupOrderSuccessState(this.response);
}

class ArriveAtPickupOrderErrorState extends AppState {
  final String message;
  ArriveAtPickupOrderErrorState(this.message);
}

// Confirm Pickup Order
class ConfirmPickupOrderLoadingState extends AppState {}

class ConfirmPickupOrderSuccessState extends AppState {
  final OrderActionResponse response;
  ConfirmPickupOrderSuccessState(this.response);
}

class ConfirmPickupOrderErrorState extends AppState {
  final String message;
  ConfirmPickupOrderErrorState(this.message);
}

// Arrive Dropoff Order
class ArriveAtDropoffOrderLoadingState extends AppState {}

class ArriveAtDropoffOrderSuccessState extends AppState {
  final OrderActionResponse response;
  ArriveAtDropoffOrderSuccessState(this.response);
}

class ArriveAtDropoffOrderErrorState extends AppState {
  final String message;
  ArriveAtDropoffOrderErrorState(this.message);
}

// Complete Delivery Order
class CompleteDeliveryOrderLoadingState extends AppState {}

class CompleteDeliveryOrderSuccessState extends AppState {
  final OrderActionResponse response;
  CompleteDeliveryOrderSuccessState(this.response);
}

class CompleteDeliveryOrderErrorState extends AppState {
  final String message;
  CompleteDeliveryOrderErrorState(this.message);
}
//------------------------------------------------------------------------------
