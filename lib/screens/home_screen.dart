import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaplex/screens/bottomnav.dart';
import 'package:spaplex/utils/categories.dart';
import 'package:spaplex/utils/product_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.pink,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/map');
                        },
                        icon: const Icon(
                          Icons.location_on,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      'Kalopul, Kathmandu',
                      style: TextStyle(fontSize: 28),
                    ),
                    const CircleAvatar(
                      radius: 20,
                      child: Icon(
                        Icons.notifications,
                        size: 24,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                height: 100,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome to SpaPlex',
                      style: TextStyle(fontSize: 34, color: Color(0xffF96C6C)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Cosmetics of YOUR Choice',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Category(),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Our Products',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: double.infinity,
                child: ProductAll(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class Proximity extends StatefulWidget {
  const Proximity({Key? key}) : super(key: key);

  @override
  State<Proximity> createState() => _ProximityState();
}

class _ProximityState extends State<Proximity> {
  double _proximity = 0;
  final List<StreamSubscription<dynamic>> _streamSubscription =
      <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    super.initState();
    _streamSubscription.add(proximityEvents!.listen((ProximityEvent event) {
      setState(() {
        _proximity = event.proximity;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _proximity >= 30
          ? Center(
              child: SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () => Get.to(const Mainscreen()),
                    child: const Text('Add Product')),
              ),
            )
          : null,
    );
  }
}
