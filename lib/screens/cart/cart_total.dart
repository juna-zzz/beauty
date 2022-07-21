import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/controller.dart';
import '../checkout/payment_screen.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(controller.total);
    return Container(
      height: 100,
      color: Colors.pink,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Obx(() => Text(
                    'Rs' ' ' + controller.total,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  )),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  if (controller.total != '0') {
                    Get.to(const PaymentScreen());
                  }
                },
                child: Text(
                  controller.total != '0'
                      ? 'Proceed to Checkout'
                      : 'Add Items to Cart',
                  style: const TextStyle(color: Colors.black, fontSize: 28),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
