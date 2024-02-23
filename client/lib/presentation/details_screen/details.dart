
import 'package:coffee_app/domain/models/coffee.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.data});

  final Coffee data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        forceMaterialTransparency: true,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black, size: 32)
        ),
      ),
      body: _DetailsBody(itemData: data),
    );
  }
}

class _DetailsBody extends StatelessWidget {
  const _DetailsBody({super.key, required this.itemData});

  final Coffee itemData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(16),
              //   child: Image.network(
              //     itemData.imagePath
              //   )
              // ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(itemData.name, style: const TextStyle(fontSize:24, fontWeight: FontWeight.w600))
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(itemData.subname, style: const TextStyle(color: Colors.grey),)
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star_rounded, color: Colors.orange),
                  Text(itemData.score.toString(), style: const TextStyle(fontSize: 18))
                ],
              ),
              const Divider(thickness: 2),
              const Row(
                children: [
                  Text('Description', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  children: [
                    Text(
                      itemData.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16)
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

