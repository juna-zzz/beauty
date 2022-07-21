import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product.dart';

class MyController extends GetxController {
  var items = 1.obs;

  increament() {
    items.value++;
  }

  decreament() {
    if (items.value > 1) {
      items.value--;
    } else {
      Get.snackbar("Product", "Cannot Buy less than 1");
      const Icon(Icons.alarm);
      BlurStyle.normal;
      const Duration(seconds: 3);
    }
  }
}

class UserName extends GetxController {
  String userName = '';

  addName(name) {
    userName = name;
  }
}

class CartController extends GetxController {
  final _product = {}.obs;

  void addProduct(Product product) {
    if (_product.containsKey(product)) {
      _product[product] += 1;
    } else {
      _product[product] = 1;
    }
  }

  void clearProduct() {
    _product.clear();
  }

  get product => _product;

  void removeProduct(Product product) {
    if (_product.containsKey(product) && _product[product] == 1) {
      _product.removeWhere((key, value) => key == product);
    } else {
      _product[product] -= 1;
    }
  }

  get productSubTotal => _product.entries
      .map((product) => product.key.price * product.value)
      .toList();

  String get total {
    try {
      return _product.entries
          .map(
            (product) => num.parse(product.key.price).toInt() * product.value,
          )
          .toList()
          .reduce(
            (value, element) => value + element,
          )
          .toString();
    } catch (error) {
      return '0';
    }
  }
}
