import 'package:flutter/material.dart';
import 'package:spaplex/utils/url.dart';

import '../../model/product.dart';
import '../../repository/product_repository.dart';
import '../../response/get_product_response.dart';

class Eyes extends StatefulWidget {
  const Eyes({Key? key}) : super(key: key);

  @override
  State<Eyes> createState() => _EyesState();
}

class _EyesState extends State<Eyes> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return FutureBuilder<ProductResponse?>(
      future: ProductRepository().getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            List<Product> lstProduct = snapshot.data!.data!;
            for (int a = lstProduct.length - 1; a > -1; a--) {
              if (lstProduct[a].category != 'Eyes') {
                lstProduct.removeAt(a);
              }
            }
            return ListView.builder(
                itemCount: lstProduct.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/productinfo',
                        arguments: lstProduct[index]),
                    child: Container(
                      height: height * 0.22,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height * 0.04),
                              Text(lstProduct[index].name.toString(),
                                  style: textStyle),
                              SizedBox(height: height * 0.04),
                              Text(
                                'Rs ' + lstProduct[index].price.toString(),
                                style: textStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text("Data"),
            );
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
            ),
          );
        }
      },
    );
  }
}
