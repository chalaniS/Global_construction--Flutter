class Supplier {
  final String name;
  final String location;
  final String imageUrl;
  bool isFavorite;

  Supplier(this.name, this.location, this.imageUrl, {this.isFavorite = false});
}
