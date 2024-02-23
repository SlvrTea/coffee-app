
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late TextEditingController controller;

  final decoration = InputDecoration(
    label: const Text('Search Coffee'),
    labelStyle: const TextStyle(color: Colors.grey),
    prefixIcon: IconButton(
      icon: const Icon(Icons.search, color: Colors.white),
      onPressed: () {},
    ),
    suffixIcon: IconButton(
      icon: const Icon(Icons.settings, color: Colors.white),
      onPressed: () {},
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Color.fromARGB(255, 49, 49, 49), width: 2),
      borderRadius: BorderRadius.circular(16)
    ),
    fillColor: const Color.fromARGB(255, 49, 49, 49),
    filled: true
  );

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: decoration,
    );
  }
}
