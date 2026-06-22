import 'package:ecom_app/domain/product.domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsRepository {
  final List<Product> products = [
    Product(
      id: 1,
      name: "Computer",
      price: 3600,
      quantity: 5,
      photo: "images/laptop.webp",
      selected: false,
    ),
    Product(
      id: 2,
      name: "Printer",
      price: 2700,
      quantity: 5,
      photo: "images/printer.webp",
      selected: false,
    ),
    Product(
      id: 3,
      name: "Smart Phone",
      price: 4200,
      quantity: 5,
      photo: "images/smartphone 1.webp",
      selected: false,
    ),
    Product(
      id: 4,
      name: "Smart Phone",
      price: 2200,
      quantity: 5,
      photo: "images/smartphone 2.webp",
      selected: false,
    ),
  ];
  List<Product> getAllProducts() {
    return products;
  }

  List<Product> searchProducts(String keyword) {
    final result = products
        .where((p) => p.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    return result;
  }
}

final productRepositoryProvider = Provider((ref)=>ProductsRepository());