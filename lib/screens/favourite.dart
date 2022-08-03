import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spaplex/screens/home_screen.dart';

import '../../utils/controller.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  final UserName uName = Get.put(UserName());

  @override
  void initState() {
    super.initState();
    openBox();
  }

  openBox() async {
    await Hive.openBox('favourite');
  }

  @override
  Widget build(BuildContext context) {
    var box2 = Hive.box('favourite');

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          'Favourites',
          style: TextStyle(fontSize: 26),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ValueListenableBuilder(
        valueListenable: box2.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Add Some Items to Your Favourites',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'Shop More',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                      height: 100, width: double.infinity, child: Proximity()),
                ),
              ],
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var data = box2.getAt(index)!;
                return Container(
                  margin: const EdgeInsets.all(10),
                  height: height * 0.3,
                  width: width * 1,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white),
                  child: Row(
                    children: [
                      SizedBox(
                        height: height * 0.25,
                        width: width * 0.4,
                        child: Image(image: NetworkImage(data.image)),
                      ),
                      SizedBox(width: width * 0.03),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange),
                          ),
                          Text(
                            'RS ' + data.price,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(height: height * 0.05),
                          ElevatedButton(
                              onPressed: () => box2.deleteAt(index),
                              child: const Text('Delete'))
                        ],
                      ),
                      SizedBox(width: width * 0.02),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
