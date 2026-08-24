import 'package:dartz/dartz.dart';
import 'package:metw_go/core/error/failure.dart';
import 'package:metw_go/features/contact_us/data/models/contact_us_response.dart';

abstract class ContactUsRepo {
  Future<Either<Failure, ContactUsResponse>> getContactUs();
}
