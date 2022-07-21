import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:spaplex/screens/cart/cart.dart';

import '../../utils/controller.dart';
import 'cart_total.dart';

class CartScreen extends StatelessWidget {
  final CartController controller = Get.find();
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartProduct(),
        CartTotal(),
        
      ],
    );
  }
}
