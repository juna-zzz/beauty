import 'package:flutter/material.dart';
import 'package:spaplex/model/product.dart';
import 'package:spaplex/repository/product_repository.dart';
import 'package:spaplex/response/get_product_response.dart';
import 'package:spaplex/utils/url.dart';

class ProductAll extends StatefulWidget {
  @override
  State<ProductAll> createState() => _ProductAllState();
}

class _ProductAllState extends State<ProductAll> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    const textStyle = TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
    return FutureBuilder<ProductResponse?>(
      future: ProductRepository().getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            List<Product> lstProduct = snapshot.data!.data!;
            debugPrint(lstProduct[1].name.toString());
            return SingleChildScrollView(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: lstProduct.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/productinfo',
                        arguments: lstProduct[index]),
                    child: Container(
                      height: height * 0.32,
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: width * 0.04),
                          SizedBox(
                            height: height * 0.2,
                            width: width * 0.37,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Image(
                                image: NetworkImage(
                                  baseUrl + lstProduct[index].image.toString(),
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.1),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height * 0.04),
                              SizedBox(
                                width: width * 0.31,
                                child: Text(lstProduct[index].name.toString(),
                                    style: textStyle),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Rs ' + lstProduct[index].price.toString(),
                                style: textStyle,
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: height * 0.12,
                                width: width * 0.3,
                                child: Center(
                                  child: Text(
                                    lstProduct[index].description.toString(),
                                    textAlign: TextAlign.left,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text("Data"),
            );
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          );
        }
      },
    );
  }
}
