import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/category_screen/category_items.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          SizedBox(height: height * 0.01),
          Row(
            children: [
              Column(
                children: const [],
              ),
              InkWell(
                onTap: () =>
                    Get.to(() => (const CategoryItems()), arguments: "Face"),
                child: Container(
                  height: height * 0.15,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                    color: Colors.white,
                  ),
                  child: SizedBox(
                    height: height * 0.15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        image: AssetImage('assets/face.webp'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * 0.2),
              InkWell(
                onTap: () =>
                    Get.to(() => (const CategoryItems()), arguments: "Eyes"),
                child: Container(
                  height: height * 0.15,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                    color: Colors.red,
                  ),
                  child: SizedBox(
                    height: height * 0.15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        image: AssetImage('assets/eyes.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Row(
            children: [
              InkWell(
                onTap: () =>
                    Get.to(() => (const CategoryItems()), arguments: "Hair"),
                child: Container(
                  height: height * 0.15,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                    color: Colors.red,
                  ),
                  child: SizedBox(
                    height: height * 0.15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        image: AssetImage('assets/hair.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * 0.2),
              InkWell(
                onTap: () =>
                    Get.to(() => (const CategoryItems()), arguments: "Lips"),
                child: Container(
                  height: height * 0.15,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                    color: Colors.red,
                  ),
                  child: SizedBox(
                    height: height * 0.15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        image: AssetImage('assets/lips.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
