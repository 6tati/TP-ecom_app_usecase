// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final int id;
  final String name;
  final double price;
  final int quantity;
  final String photo;
  final bool selected;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.photo,
    required this.selected,

  });

  Product copyWith({
    int? id,
    String? name,
    double? price,
    int? quantity,
    String? photo,
    bool? selected,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      photo: photo ?? this.photo,
      selected: selected ?? this.selected,
    );
  }
}