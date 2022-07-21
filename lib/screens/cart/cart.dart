import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/product.dart';
import '../../utils/controller.dart';

class CartProduct extends StatelessWidget {
  final CartController controller = Get.find();
  CartProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
            itemCount: controller.product.length,
            itemBuilder: (BuildContext context, int index) {
              return CartProductScreen(
                controller: controller,
                product: controller.product.keys.toList()[index],
                quantity: controller.product.values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class CartProductScreen extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  var size, height, width;
  CartProductScreen(
      {Key? key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
      child: Container(
        height: height * 0.3,
        width: width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: height * 0.2,
              width: width * 0.4,
              child: Image(
                image: NetworkImage(
                    'http://10.0.2.2:8080/' + product.image.toString()),
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name.toString(),
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.removeProduct(product);
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                    SizedBox(width: width * 0.02),
                    IconButton(
                      onPressed: () {
                        controller.addProduct(product);
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        size: 30,
                      ),
                    ),
                  ],
                )
              ],
            ),

            // SizedBox(width: width * 0.2),
          ],
        ),
      ),
    );
  }
}
