class Goods {
String name ;
String image;
String description;
String price;
String category;
String rating;
String id;
String brand;
String quantity;
Goods({
  required this.name,
  required this.image,
  required this.description,
  required this.price,
  required this.category,
  required this.rating,
  required this.id,
  required this.brand,
  required this.quantity  
});

  factory Goods.fromJson(Map<String, dynamic> json) {
    return Goods(
      name: json['name'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      category: json['category'] as String,
      rating: json['rating'] as String,
      id: json['id'] as String,
      brand: json['brand'] as String,
      quantity: json['quantity'] as String
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'category': category,
      'rating': rating,
      'id': id,
      'brand': brand,
      'quantity': quantity
    };
  }
  @override
  String toString() {
    return 'Goods{name: $name, image: $image, description: $description, price: $price, category: $category, rating: $rating, id: $id, brand: $brand, quantity: $quantity}';
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Goods &&
        other.name == name &&
        other.image == image &&
        other.description == description &&
        other.price == price &&
        other.category == category &&
        other.rating == rating &&
        other.id == id &&
        other.brand == brand &&
        other.quantity == quantity;
  }
  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        description.hashCode ^
        price.hashCode ^
        category.hashCode ^
        rating.hashCode ^
        id.hashCode ^
        brand.hashCode ^
        quantity.hashCode;
  }
  @override
  String toStringBrand() {
    return 'Goods{name: $name, image: $image, description: $description, price: $price, category: $category, rating: $rating, id: $id, brand: $brand, quantity: $quantity}';
  }
  @override
  bool  __(Object other) {
    if (identical(this, other)) return true;

    return other is Goods &&
        other.name == name &&
        other.image == image &&
        other.description == description &&
        other.price == price &&
        other.category == category &&
        other.rating == rating &&
        other.id == id &&
        other.brand == brand &&
        other.quantity == quantity;
  }    
}
