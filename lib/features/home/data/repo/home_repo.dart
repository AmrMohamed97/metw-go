import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/home/data/models/home_out_model/home_out_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeOutModel>> getHomeData();
}