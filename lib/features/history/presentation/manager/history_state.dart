import 'package:metw_go/features/history/data/models/history_response.dart';

abstract class HistoryState {}

class HistoryInitialState extends HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistoryPaginationLoadingState extends HistoryState {}

class HistorySuccessState extends HistoryState {
  final HistoryResponse response;

  HistorySuccessState(this.response);
}

class HistoryFailureState extends HistoryState {
  final String message;

  HistoryFailureState(this.message);
}
