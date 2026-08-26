import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/contact_us/data/models/contact_us_response.dart';
import 'package:metw_go/features/contact_us/data/repo/contact_us_repo.dart';
import 'package:metw_go/features/contact_us/presentation/manager/contact_us_state.dart';

@injectable
class ContactUsCubit extends Cubit<ContactUsState> {
  final ContactUsRepo repo;

  ContactUsCubit(this.repo) : super(ContactUsInitialState());

  ContactUsDataModel? contactUsData;

  void init() {
    getContactUs();
  }

  Future<void> getContactUs() async {
    emit(ContactUsLoadingState());
    final result = await repo.getContactUs();

    result.fold((failure) => emit(ContactUsFailureState(failure.message)), (
      response,
    ) {
      contactUsData = response.data;
      emit(ContactUsSuccessState(contactUsData ?? ContactUsDataModel()));
    });
  }
}
