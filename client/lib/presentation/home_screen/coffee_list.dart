
import 'package:coffee_app/domain/state/coffee_list/coffee_list_cubit.dart';
import 'package:coffee_app/presentation/home_screen/item_card/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeList extends StatelessWidget {
  const CoffeeList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CoffeeListCubit>();
    final state = cubit.state;
    if (state.status == Status.submissionSuccess) {
      return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        delegate: SliverChildListDelegate(
          state.coffeeList!
            .map((e) => ItemCard(e))
            .toList(),
        ),
      );
    } else {
      return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(),));
    }

  }
}
