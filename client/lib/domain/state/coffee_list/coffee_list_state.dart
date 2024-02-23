part of 'coffee_list_cubit.dart';

class CoffeeListState {
  final List<Coffee>? coffeeList;
  final Status status;

  CoffeeListState({
    this.coffeeList,
    this.status = Status.empty
  });

  CoffeeListState copyWith({
    List<Coffee>? coffeeList,
    Status? status
  }) {
    return CoffeeListState(
      coffeeList: coffeeList ?? this.coffeeList,
      status: status ?? this.status
    );
  }
}
