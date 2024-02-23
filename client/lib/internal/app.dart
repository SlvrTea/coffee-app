import 'package:coffee_app/data/service/api_service.dart';
import 'package:coffee_app/domain/state/coffee_list/coffee_list_cubit.dart';
import 'package:coffee_app/domain/state/scroll_selector/scroll_selector_cubit.dart';
import 'package:coffee_app/presentation/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/state/navigation/nav_bar_cubit.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final navBar = NavBarCubit();
    final scrollSelector = ScrollSelectorCubit();
    final coffeeList = CoffeeListCubit(RestApi())
      ..getCoffee();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => navBar,
        ),
        BlocProvider(
          create: (context) => scrollSelector,
        ),
        BlocProvider(
          create: (_) => coffeeList
        ),
      ],
      child: MaterialApp(
        title: 'Coffee App',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 198, 124, 78)),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                selectedIconTheme: IconThemeData(
                    color: Color.fromARGB(255, 198, 124, 78)
                ),
                unselectedIconTheme: IconThemeData(
                    color: Color.fromARGB(255, 141, 141, 141)
                )
            ),
            buttonTheme: const ButtonThemeData(
              minWidth: 32,
              height: 32,
              buttonColor: Color.fromARGB(255, 198, 124, 78)
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: const Home(),
      ),
    );
  }
}
