
import 'package:coffee_app/domain/state/navigation/nav_bar_cubit.dart';
import 'package:coffee_app/presentation/home_screen/coffee_list.dart';
import 'package:coffee_app/presentation/home_screen/filter.dart';
import 'package:coffee_app/presentation/search_bar/search_bar.dart';
import 'package:coffee_app/presentation/nav_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final List<Widget> tabItems = const [
    MainTab(),
    Center(child: Text("1")),
    Center(child: Text("2")),
    Center(child: Text("3"))
  ];

  @override
  Widget build(BuildContext context) {
    var navBarCubit = context.watch<NavBarCubit>();
    return Scaffold(
      bottomNavigationBar: NavBar(
        items: [
          NavBarItem.defaultTheme(icon: const Icon(Icons.home_rounded)),
          NavBarItem.defaultTheme(icon: const Icon(Icons.favorite_rounded)),
          NavBarItem.defaultTheme(icon: const Icon(Icons.shopping_bag_rounded)),
          NavBarItem.defaultTheme(icon: const Icon(Icons.notifications))
        ],
        onItemSelected: (index) => navBarCubit.changeTab(index),
        selectedIndex: navBarCubit.state,
        iconSize: 30,
      ),
      body: tabItems[navBarCubit.state]
    );
  }
}

class MainTab extends StatelessWidget {
  const MainTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              color: const Color.fromARGB(255, 28, 28, 28),
              width: double.infinity,
              height: 280,
            ),
            const CustomScrollView(
              slivers: [
                CoffeeList()
              ]
            ),
          ]

        ),
      )
      // SingleChildScrollView(
      //   child: Stack(
      //     alignment: Alignment.topCenter,
      //     children: [
      //       Container(
      //         color: const Color.fromARGB(255, 28, 28, 28),
      //         width: double.infinity,
      //         height: 280,
      //       ),
      //       SizedBox(
      //         width: MediaQuery.of(context).size.width * 0.8,
      //         child: SingleChildScrollView(
      //           child: Column(
      //             children: [
      //               const Padding(
      //                 padding: EdgeInsets.only(top: 32),
      //                 child: Row(
      //                   children: [
      //                     Text('Location', style: TextStyle(color: Colors.grey, fontSize: 12)),
      //                   ],
      //                 ),
      //               ),
      //               const Padding(
      //                 padding: EdgeInsets.only(bottom: 16, top: 4),
      //                 child: Row(
      //                   children: [
      //                     Text('Moscow, Russia', style: TextStyle(color: Colors.white, fontSize: 14)),
      //                     Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white)
      //                   ],
      //                 ),
      //               ),
      //               const SearchBarWidget(),
      //               const SizedBox(height: 8),
      //               ClipRRect(
      //                 borderRadius: BorderRadius.circular(16),
      //                 child: Image.network(
      //                   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA66T9grj_qmC9AVvyvEfi3UxRBFg_7-Y4Dg&usqp=CAU',
      //                   width: 315,
      //                   height: 140,
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //               const ScrollBarWidget(
      //                 items: [
      //                   'Cappuccino',
      //                   'Latte',
      //                   'Machiato',
      //                   'Americano'
      //                 ],
      //               ),
      //               const CoffeeList()
      //             ],
      //           ),
      //         ),
      //       ),
      //     ]
      //   ),
      // ),
    );
  }
}


