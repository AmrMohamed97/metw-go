import 'package:metw_go/features/aggregation/data/models/aggregation_response.dart';

abstract class AggregationState {}

class AggregationInitialState extends AggregationState {}

class AggregationLoadingState extends AggregationState {}

class AggregationLoadedState extends AggregationState {
  final List<AggregationBatchModel> batches;

  AggregationLoadedState(this.batches);
}

class AggregationErrorState extends AggregationState {
  final String error;

  AggregationErrorState(this.error);
}
