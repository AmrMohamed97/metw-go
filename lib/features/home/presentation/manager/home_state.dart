abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeStatusChanged extends HomeState {
  final String status;
  HomeStatusChanged(this.status);
}