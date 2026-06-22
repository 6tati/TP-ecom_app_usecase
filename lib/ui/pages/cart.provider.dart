import 'package:ecom_app/domain/product.domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardNotifier extends Notifier<Set<Product>> {
  @override
  Set<Product> build() {
    return {};
  }

  void addProduct(Product product) {
    state = {...state, product};
  }
  void removeProduct (Product product){
    state = state.where((p) => p!=product).toSet();
  }
}

final cardProvider = NotifierProvider<CardNotifier, Set<Product>>(
  () => CardNotifier(),
);