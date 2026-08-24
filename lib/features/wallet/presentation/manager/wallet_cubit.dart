import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/wallet/data/models/wallet_overview_response.dart';
import 'package:metw_go/features/wallet_transaction/data/models/wallet_operation_response.dart';
import 'package:metw_go/features/wallet/data/repo/wallet_repo.dart';
import 'package:metw_go/features/wallet/presentation/manager/wallet_state.dart';

@injectable
class WalletCubit extends Cubit<WalletState> {
  final WalletRepo walletRepo;

  WalletCubit({required this.walletRepo}) : super(WalletInitialState());

  WalletOverviewDataModel? overviewData;
  List<WalletOperationItemModel> operations = [];

  void init() {
    getWalletData();
  }

  Future<void> getWalletData() async {
    emit(WalletLoadingState());

    final overviewResult = await walletRepo.getWalletOverview();
    final operationsResult = await walletRepo.getWalletOperations(
      page: 1,
      perPage: 5,
    );

    overviewResult.fold(
      (failure) => emit(WalletFailureState(failure.message)),
      (overviewResp) {
        overviewData = overviewResp.data;

        operationsResult.fold(
          (failure) {
            emit(
              WalletSuccessState(
                overviewData: overviewData ?? WalletOverviewDataModel(),
                operations: operations,
              ),
            );
          },
          (operationsResp) {
            operations = operationsResp.data?.items ?? [];
            emit(
              WalletSuccessState(
                overviewData: overviewData ?? WalletOverviewDataModel(),
                operations: operations,
              ),
            );
          },
        );
      },
    );
  }
}
