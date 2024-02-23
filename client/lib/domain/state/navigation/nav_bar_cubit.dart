import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class NavBarCubit extends Cubit<int> {
  NavBarCubit() : super(0);

  void changeTab(int index) => emit(index);
}
