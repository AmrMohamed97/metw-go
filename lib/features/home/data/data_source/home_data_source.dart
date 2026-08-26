import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/home/data/models/home_out_model/home_out_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_data_source.g.dart';

@injectable
@RestApi()
abstract class HomeDataSource {
  @FactoryMethod()
  factory HomeDataSource(Dio dio) = _HomeDataSource;

  @GET(EndPoints.homeUrl)
  Future<HomeOutModel> getHomeData();
}
