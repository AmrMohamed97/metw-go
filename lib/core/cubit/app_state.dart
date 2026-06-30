abstract class AppState {}

class AppInitial extends AppState {}

class HomeStatusChanged extends AppState {
  final String status;
  HomeStatusChanged(this.status);
}

class ChangeLanguageState extends AppState {}

class ChangeThemeState extends AppState {}

class ApplogoutLoadingState extends AppState {}

class ApplogoutLogoutSuccessState extends AppState {}

class ApplogoutErrorState extends AppState {
  final String message;

  ApplogoutErrorState(this.message);
}
