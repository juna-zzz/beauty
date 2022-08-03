class ProductModel {
  String? productname;
  String? price;
  String? description;

  ProductModel({this.productname, this.price, this.description});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productname = json['productname'];
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productname'] = this.productname;
    data['price'] = this.price;
    data['description'] = this.description;
    return data;
  }
}
