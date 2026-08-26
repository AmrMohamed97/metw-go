import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/faq/data/models/faq_response.dart';
import 'package:metw_go/features/faq/data/repo/faq_repo.dart';
import 'package:metw_go/features/faq/presentation/manager/faq_state.dart';

@injectable
class FaqCubit extends Cubit<FaqState> {
  final FaqRepo repo;

  FaqCubit(this.repo) : super(FaqInitialState());

  FaqDataModel? faqData;

  void init() {
    getFaq();
  }

  Future<void> getFaq() async {
    emit(FaqLoadingState());
    final result = await repo.getFaq();

    result.fold((failure) => emit(FaqFailureState(failure.message)), (
      response,
    ) {
      faqData = response.data;
      emit(FaqSuccessState(faqData ?? FaqDataModel()));
    });
  }
}
