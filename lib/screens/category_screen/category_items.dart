import 'package:flutter/material.dart';
import 'package:spaplex/screens/category_screen/eyes.dart';
import 'package:spaplex/screens/category_screen/face.dart';
import 'package:spaplex/screens/category_screen/hair.dart';
import 'package:spaplex/screens/category_screen/lips.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({Key? key}) : super(key: key);

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          category.toString().toUpperCase(),
          style: const TextStyle(fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: category == 'Face'
              ? const Face()
              : category == 'Eyes'
                  ? const Eyes()
                  : category == 'Hair'
                      ? const Hair()
                      : const Lips()),
    );
  }
}
