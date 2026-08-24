import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/wallet_transaction/data/models/wallet_operation_response.dart';
import 'package:metw_go/features/wallet_transaction/data/repo/wallet_operation_repo.dart';
import 'package:metw_go/features/wallet_transaction/presentation/manager/wallet_operation_state.dart';

@injectable
class WalletOperationCubit extends Cubit<WalletOperationState> {
  final WalletOperationRepo repo;

  WalletOperationCubit(this.repo) : super(WalletOperationInitial());

  final ScrollController scrollController = ScrollController();

  List<WalletOperationItemModel> operations = [];
  int currentPage = 1;
  bool hasMore = true;
  bool isLoadingMore = false;

  void init() {
    scrollController.addListener(_onScroll);
    getWalletOperations();
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        hasMore &&
        !isLoadingMore &&
        state is! WalletOperationLoading) {
      loadMoreOperations();
    }
  }

  Future<void> getWalletOperations() async {
    currentPage = 1;
    hasMore = true;
    operations.clear();
    emit(WalletOperationLoading());

    final result = await repo.getWalletOperations(page: currentPage);

    result.fold(
      (failure) => emit(WalletOperationFailure(failure.message)),
      (response) {
        final data = response.data;
        operations = List.from(data?.items ?? []);
        hasMore = data?.pagination?.hasMore ?? false;
        emit(WalletOperationSuccess(items: operations, hasMore: hasMore));
      },
    );
  }

  Future<void> loadMoreOperations() async {
    if (!hasMore || isLoadingMore) return;
    isLoadingMore = true;
    emit(WalletOperationMoreLoading());

    final nextPage = currentPage + 1;
    final result = await repo.getWalletOperations(page: nextPage);

    result.fold(
      (failure) {
        isLoadingMore = false;
        emit(WalletOperationSuccess(items: operations, hasMore: hasMore));
      },
      (response) {
        final data = response.data;
        final newItems = data?.items ?? [];
        operations.addAll(newItems);
        currentPage = nextPage;
        hasMore = data?.pagination?.hasMore ?? false;
        isLoadingMore = false;
        emit(WalletOperationSuccess(items: operations, hasMore: hasMore));
      },
    );
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
