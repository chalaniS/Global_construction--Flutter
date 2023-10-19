class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String supplierName;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.supplierName,
  });

  // A factory constructor to create a Product instance from a map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: (map['price'] as num).toDouble(),
      supplierName: map['supplierName'],
    );
  }

  // A method to convert a Product instance to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'supplierName': supplierName,
    };
  }
}
