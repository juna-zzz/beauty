import 'package:json_annotation/json_annotation.dart';

part 'product_category.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class ProductCategory {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? description;
  String? image;
  String? price;

  ProductCategory({
    this.name,
    this.description,
    this.image,
    this.price,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
}
