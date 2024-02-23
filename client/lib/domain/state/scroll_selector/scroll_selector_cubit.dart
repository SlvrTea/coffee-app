import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class ScrollSelectorCubit extends Cubit<int> {
  ScrollSelectorCubit() : super(0);

  void changeSelected(int index) => emit(index);
}
