import 'package:ecom_app/application/providers/products.providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(allProductsProvider);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context , index) => ListTile(
                  title: Card.outlined(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Image.asset(allProducts[index].photo, width: 150,),
                        VerticalDivider(),
                        Column(
                          children: [
                            Text("${allProducts[index].id}"),
                            Text("${allProducts[index].id}")
                          ],
                        )
                      ],),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: allProducts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
