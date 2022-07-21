class Product {
  String? name;
  String? price;
  String? description;
  String? qty;
  String? category;
  String? image;

  Product(
      {this.name,
      this.price,
      this.description,
      this.qty,
      this.category,
      this.image});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    description = json['description'];
    qty = json['qty'];
    category = json['category'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['qty'] = qty;
    data['category'] = category;
    data['image'] = image;
    return data;
  }
}
