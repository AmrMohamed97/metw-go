import 'package:metw_go/features/home/data/models/home_out_model/home_out_model.dart';
import 'package:metw_go/features/home/data/models/status_out_model/status_out_model.dart';

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


class ChangeStatusLoading extends HomeState {}

class ChangeStatusSuccess extends HomeState {
  final StatusOutModel statusOutModel;
  ChangeStatusSuccess(this.statusOutModel);
}

class ChangeStatusFailure extends HomeState {
  final String message;
  ChangeStatusFailure(this.message);
}
