import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/home/presentation/manager/home_state.dart';
import 'package:metw_go/features/home/presentation/services/firebase_rtdb_helper.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    realTime(9);
  }

  String status = 'offline';
  StreamSubscription<DatabaseEvent>? _statusSubscription;
  final FirebaseDatabase _database = FirebaseRtdbHelper.database;

  Future<void> realTime(int driverId) async {
    // Listen to the specific driver's status
    final statusRef = _database.ref('drivers/$driverId/status');

    _statusSubscription = statusRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        status = event.snapshot.value.toString();
        emit(HomeStatusChanged(status));
      }
    });
  }

  @override
  Future<void> close() {
    _statusSubscription?.cancel();
    return super.close();
  }
}
