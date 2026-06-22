import 'package:ecom_app/data/product.repository.dart';
import 'package:ecom_app/domain/product.domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allProductsProvider = Provider<List<Product>>((ref){
   return ref.read(productRepositoryProvider).getAllProducts();
});

