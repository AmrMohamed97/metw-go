import 'package:metw_go/features/wallet_transaction/data/models/wallet_operation_response.dart';

abstract class WalletOperationState {}

class WalletOperationInitial extends WalletOperationState {}

class WalletOperationLoading extends WalletOperationState {}

class WalletOperationMoreLoading extends WalletOperationState {}

class WalletOperationSuccess extends WalletOperationState {
  final List<WalletOperationItemModel> items;
  final bool hasMore;

  WalletOperationSuccess({required this.items, required this.hasMore});
}

class WalletOperationFailure extends WalletOperationState {
  final String message;

  WalletOperationFailure(this.message);
}
