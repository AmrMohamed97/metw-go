import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/register_steps/data/models/fifth_step_input_model.dart';
import 'package:metw_go/features/register_steps/data/repo/fifth_step_repo.dart';
import 'package:metw_go/features/register_steps/presentation/manager/fifth_step_cubit/fifth_step_state.dart';

@injectable
class FifthStepCubit extends Cubit<FifthStepState> {
  final FifthStepRepo repo;

  FifthStepCubit(this.repo) : super(FifthStepInitial());

  Future<void> submitFifthStep(FifthStepInputModel input) async {
    emit(SubmitFifthStepLoading());
    final result = await repo.submitFifthStep(input);
    result.fold(
      (failure) => emit(SubmitFifthStepFailure(failure.message)),
      (response) => emit(SubmitFifthStepSuccess()),
    );
  }
}
