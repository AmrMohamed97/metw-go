import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/history/data/models/history_response.dart';
import 'package:metw_go/features/history/data/repo/history_repo.dart';
import 'package:metw_go/features/history/presentation/manager/history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  final HistoryRepo repo;

  HistoryCubit(this.repo) : super(HistoryInitialState());

  String selectedStatus = 'all';
  String searchQuery = '';
  int currentPage = 1;
  bool hasMore = false;
  bool isLoadingMore = false;

  List<HistoryFilterModel> filters = [];
  List<HistoryOrderItemModel> orders = [];
  HistoryDataModel? historyData;

  void init() {
    getHistoryOrders(isRefresh: true);
  }

  Future<void> getHistoryOrders({
    bool isRefresh = false,
    String? newStatus,
    String? newSearch,
  }) async {
    if (newStatus != null) selectedStatus = newStatus;
    if (newSearch != null) searchQuery = newSearch;

    if (isRefresh) {
      currentPage = 1;
      orders.clear();
      emit(HistoryLoadingState());
    } else {
      if (!hasMore || isLoadingMore) return;
      isLoadingMore = true;
      emit(HistoryPaginationLoadingState());
    }

    final result = await repo.getHistoryOrders(
      status: selectedStatus,
      search: searchQuery,
      page: currentPage,
      limit: 10,
    );

    isLoadingMore = false;

    result.fold(
      (failure) => emit(HistoryFailureState(failure.message)),
      (response) {
        historyData = response.data?.history;
        filters = historyData?.filters ?? [];
        final newOrders = historyData?.orders ?? [];

        if (isRefresh) {
          orders = newOrders;
        } else {
          orders.addAll(newOrders);
        }

        hasMore = response.data?.meta?.hasMore ?? false;
        if (hasMore) {
          currentPage++;
        }

        emit(HistorySuccessState(response));
      },
    );
  }

  void changeFilter(String filterKey) {
    if (selectedStatus == filterKey) return;
    getHistoryOrders(isRefresh: true, newStatus: filterKey);
  }

  void search(String query) {
    getHistoryOrders(isRefresh: true, newSearch: query);
  }
}
