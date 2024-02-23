
import 'package:coffee_app/domain/models/coffee.dart';
import 'package:coffee_app/presentation/details_screen/details.dart';
import 'package:coffee_app/presentation/home_screen/item_card/item_data.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(this.item, {super.key});

  final Coffee item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      width: 150,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => DetailsScreen(data: item))
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              Stack(
                children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(16),
                  //   child: Image.network(
                  //     item.imagePath,
                  //     width: 141,
                  //     height: 132,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(16)),
                    child: Container(
                      width: 50,
                      height: 25,
                      color: const Color.fromARGB(120, 0, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.star_rounded, size: 12, color: Colors.orangeAccent),
                            Text(item.score.toString(), style: const TextStyle(color: Colors.white, fontSize: 10)),
                          ],
                        ),
                      )
                    ),
                  )
                ]
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                    child: Text(item.subname, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('\$ ${item.price}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: const Color.fromARGB(255, 198, 124, 78),
                        width: 32,
                        height: 32,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {},
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
