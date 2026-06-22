import 'package:ecom_app/data/product.repository.dart';
import 'package:ecom_app/domain/product.domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final allProductsProvider = Provider<List<Product>>((ref){
   return ref.read(productRepositoryProvider).getAllProducts();
});


final searchKeywordStateProvider = StateProvider<String>((ref) {
  return "";
});

final searchProductsProvider = Provider<List<Product>>((ref){
  String keyword = ref.watch(searchKeywordStateProvider);
   return ref.read(productRepositoryProvider).searchProducts(keyword);
});


