
class ProductDetails{
  final String image;
  final String name;
  final String color;
  final String size;
  final int quantity;
  final String price;
  final String type;
  final String units;

  ProductDetails({
    required this.image,
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    required this.quantity,
    required this.type,
    required this.units
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'color': color,
      'size' : size,
      'quantity': quantity,
      'price': price,
      'type' : type,
      'units' : units,
    };
  }
}