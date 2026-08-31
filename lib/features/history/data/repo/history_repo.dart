import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/history/data/models/history_response.dart';

abstract class HistoryRepo {
  Future<Either<Failure, HistoryResponse>> getHistoryOrders({
    String? status,
    String? search,
    int? page,
    int? limit,
  });
}
