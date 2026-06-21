import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/features/home/presentation/manager/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
}