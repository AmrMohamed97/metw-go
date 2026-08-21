import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/features/register/data/models/register_input_model/register_input_model.dart';
import 'package:metw_go/features/register/data/models/register_out_model/register_out_model.dart';
import 'package:retrofit/retrofit.dart';

part 'register_data_source.g.dart';

@injectable
@RestApi()
abstract class RegisterDataSource {
  @FactoryMethod()
  factory RegisterDataSource(Dio dio) = _RegisterDataSource;

  // @GET("/admin/users")
  // Future<GetUsersResponse> getUsers({
  //   @Query("type") String? type,
  //   @Query("page") int? page,
  // });

  @POST(EndPoints.registerUrl)
  Future<RegisterOutModel> createUser(
    @Body() RegisterInputModel createUserModel,
  );

  // @DELETE("/users/{id}")
  // Future<EmptyDataResponse> deleteUser(@Path("id") int id);

  // @POST("/users/{id}/update")
  // Future<EmptyDataResponse> updateUser(
  //   @Path("id") int id,
  //   @Body() UpdateUserModel updateUserModel,
  // );

  // @PATCH("/admin/users/{id}/status")
  // Future<EmptyDataResponse> updateUserStatus(
  //   @Path("id") int id,
  //   @Query("status") String status,
  // );
}
