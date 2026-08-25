import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/home/presentation/page/home_page.dart';
import 'package:metw_go/features/main_view/manager/main_view_state.dart';
import 'package:metw_go/features/orders/presentation/page/orders_page.dart';
import 'package:metw_go/features/profile/presentation/page/profile_page.dart';
import 'package:metw_go/features/wallet/presentation/page/wallet_page.dart';


@injectable
class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit() : super(MainViewInitial());
  int currentIndex = 0; // Starts with Home
  final List<Widget> pages = [
      HomePage(),
      OrdersPage(),
      WalletPage(),
      ProfilePage(),
    ];
    
  void changePage(int index) {
    currentIndex = index;
    emit(MainViewTap());
  }
}
