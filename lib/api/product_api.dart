import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

import 'package:spaplex/api/http_services.dart';
import '../model/product.dart';
import '../response/get_product_response.dart';
import '../utils/url.dart';

class ProductAPI {
  Future<bool> addProduct(File? file, Product product) async {
    try {
      var url = baseUrl + addProductUrl;
      var dio = HttpServices().getDioInstance();
      MultipartFile? image;
      if (file != null) {
        var mimeType = lookupMimeType(file.path);

        image = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split("/").last,
          contentType: MediaType("image", mimeType!.split("/")[1]),
        ); //
      }
      var formData = FormData.fromMap({
        "name": product.name,
        "description": product.description,
        "image": image,
        "price": product.price,
        "category": product.category,
        "qty": product.qty
      });
      var response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          },
        ),
      );
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      throw Exception(e);
    }
    return false;
  }

  Future<ProductResponse?> getProducts() async {
    Future.delayed(const Duration(seconds: 2), () {});
    var url = baseUrl + getProductUrl;
    ProductResponse? productResponse;
    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(url,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: "Bearer $token",
            },
          ));
      Map<String, dynamic> responseBody = response.data;

      if (response.statusCode == 200) {
        productResponse = ProductResponse.fromJson(responseBody);
      } else {
        productResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    return productResponse;
  }
}
