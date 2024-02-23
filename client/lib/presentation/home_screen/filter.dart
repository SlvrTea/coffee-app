
import 'package:coffee_app/domain/state/scroll_selector/scroll_selector_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollBarWidget extends StatelessWidget {
  const ScrollBarWidget({super.key, required this.items});

  final List<String> items;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((item) {
          return ScrollSelectorItem(label: item, itemIndex: items.indexOf(item));
        }).toList()
      ),
    );
  }
}

class ScrollSelectorItem extends StatelessWidget {
  const ScrollSelectorItem({super.key, required this.label, required this.itemIndex});
  final String label;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ScrollSelectorCubit>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => cubit.changeSelected(itemIndex),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            cubit.state == itemIndex
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).scaffoldBackgroundColor
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
          )
        ),
        child: Text(label,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: cubit.state == itemIndex
                  ? Colors.white
                  : Colors.black
          ),
        ),
      ),
    );
  }
}