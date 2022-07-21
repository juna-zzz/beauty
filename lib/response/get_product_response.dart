import 'package:json_annotation/json_annotation.dart';

import '../model/product.dart';

part 'get_product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  bool? success;
  List<Product>? data;

  ProductResponse({this.success, this.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
