import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:spaplex/utils/url.dart';

import '../model/favourite.dart';
import '../model/product.dart';
import '../utils/controller.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  final CartController cartController = Get.put(CartController());
  late Box box;
  List<String> id = [];

  @override
  Widget build(BuildContext context) {
    final productInfo = ModalRoute.of(context)!.settings.arguments as Product;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    @override
    String nameP = productInfo.name.toString();
    String priceP = productInfo.price.toString();
    String imageP = baseUrl + productInfo.image.toString();

    placeData() async {
      FavouriteM favourite = FavouriteM(
        name: nameP,
        price: priceP,
        image: imageP,
      );
      for (var i = 0; i < box.length; i++) {
        id = id + [box.getAt(i).name];
      }
      // debugPrint(id.toString());
      if (id.contains(nameP)) {
        return false;
      } else {
        await box.add(favourite);
      }
    }

    @override
    void createBox() async {
      box = await Hive.openBox('favourite');
      placeData();
    }

    _favourite() {
      return SizedBox(
        width: width * 0.9,
        height: height * 0.07,
        child: ElevatedButton(
          onPressed: () {
            Get.snackbar("Product", "Added to Favourite");
            createBox();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Icon(
            Icons.favorite_outlined,
            size: 45,
            color: Colors.white,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(nameP),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_favourite()],
                ),
              ),
              SizedBox(height: height * 0.01),
              const Text(
                'Add To Favourites',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height * 0.05),
              Center(
                child: SizedBox(
                  width: 200,
                  child: Image.network(
                    baseUrl + productInfo.image.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),
              SizedBox(
                height: height * 0.2,
                child: Text(
                  productInfo.description.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: height * 0.15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.pink,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Text(
                          'Price: ',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        SizedBox(width: width * 0.01),
                        Text(
                          'Rs ${productInfo.price}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(width: width * 0.15),
                        InkWell(
                          child: Container(
                            height: height * 0.07,
                            width: width * 0.3,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            cartController.addProduct(productInfo);
                            Get.snackbar(productInfo.name.toString(),
                                "Successfully Added to Cart");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
