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
