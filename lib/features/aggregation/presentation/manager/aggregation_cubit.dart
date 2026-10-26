import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/aggregation/data/models/aggregation_response.dart';
import 'package:metw_go/features/aggregation/data/repo/aggregation_repo.dart';
import 'package:metw_go/features/aggregation/presentation/manager/aggregation_state.dart';

@injectable
class AggregationCubit extends Cubit<AggregationState> {
  final AggregationRepo _repo;

  AggregationCubit(this._repo) : super(AggregationInitialState());

  List<AggregationBatchModel> batches = [];

  Future<void> getAggregations() async {
    emit(AggregationLoadingState());
    final result = await _repo.getAggregations();
    result.fold(
      (failure) => emit(AggregationErrorState(failure.message)),
      (response) {
        batches = response.data?.batches ?? [];
        emit(AggregationLoadedState(batches));
      },
    );
  }
}
