import 'package:metw_go/features/home/data/models/home_out_model/home_out_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

// class HomeStatusChanged extends HomeState {
//   final String status;
//   HomeStatusChanged(this.status);
// }

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final HomeOutModel homeData;
  HomeSuccess(this.homeData);
}

class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}
