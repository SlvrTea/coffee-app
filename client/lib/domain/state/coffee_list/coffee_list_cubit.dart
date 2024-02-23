import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/service/api_service.dart';
import '../../models/coffee.dart';

part 'coffee_list_state.dart';

enum Status {
  submissionInProgress,
  submissionSuccess,
  submissionFailure,
  empty
}

class CoffeeListCubit extends Cubit<CoffeeListState> {
  final RestApi api;
  CoffeeListCubit(this.api) : super(CoffeeListState());

  void getCoffee() async {
    emit(state.copyWith(status: Status.submissionInProgress));
    try {
      final coffeeList = await api.getCoffeeList();
      emit(state.copyWith(coffeeList: coffeeList, status: Status.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(status: Status.submissionFailure));
    }
  }
}
