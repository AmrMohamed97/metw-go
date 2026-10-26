import 'package:metw_go/features/aggregation_details/data/models/aggregation_details_response.dart';

abstract class AggregationDetailsState {}

class AggregationDetailsInitialState extends AggregationDetailsState {}

class AggregationDetailsLoadingState extends AggregationDetailsState {}

class AggregationDetailsLoadedState extends AggregationDetailsState {
  final AggregationDetailsData details;

  AggregationDetailsLoadedState(this.details);
}

class AggregationDetailsErrorState extends AggregationDetailsState {
  final String error;

  AggregationDetailsErrorState(this.error);
}

class SelectShipmentsLoadingState extends AggregationDetailsState {}

class SelectShipmentsSuccessState extends AggregationDetailsState {
  final String message;

  SelectShipmentsSuccessState(this.message);
}

class SelectShipmentsErrorState extends AggregationDetailsState {
  final String error;

  SelectShipmentsErrorState(this.error);
}

class SelectionUpdatedState extends AggregationDetailsState {
  final int selectedCount;

  SelectionUpdatedState(this.selectedCount);
}
