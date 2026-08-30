import 'package:metw_go/features/wallet/data/models/wallet_overview_response.dart';
import 'package:metw_go/features/wallet_transaction/data/models/wallet_operation_response.dart';

abstract class WalletState {}

class WalletInitialState extends WalletState {}

class WalletLoadingState extends WalletState {}

class WalletSuccessState extends WalletState {
  final WalletOverviewDataModel overviewData;
  final List<WalletOperationItemModel> operations;

  WalletSuccessState({required this.overviewData, required this.operations});
}

class WalletFailureState extends WalletState {
  final String message;

  WalletFailureState(this.message);
}

class WithdrawLoadingState extends WalletState {}

class WithdrawSuccessState extends WalletState {
  final String message;

  WithdrawSuccessState(this.message);
}

class WithdrawFailureState extends WalletState {
  final String message;

  WithdrawFailureState(this.message);
}
