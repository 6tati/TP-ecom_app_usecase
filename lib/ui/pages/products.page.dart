import 'package:ecom_app/application/providers/products.providers.dart';
import 'package:ecom_app/ui/pages/card.product.page.dart';
import 'package:ecom_app/ui/pages/cart.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(searchProductsProvider);
    final keyword = ref.watch(searchKeywordStateProvider);
    final card = ref.watch(cardProvider);
    TextEditingController searchProductController = TextEditingController(
      text: keyword,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CardPage()),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        ref.read(searchKeywordStateProvider.notifier).state =
                            value;
                      },
                      controller: searchProductController,
                      decoration: InputDecoration(
                        hintText: "Search with Name Product",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      String kw = searchProductController.text;
                      ref.read(searchKeywordStateProvider.notifier).state = kw;
                    },
                    icon: Icon(Icons.search),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  title: Card.outlined(
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(allProducts[index].photo, width: 150),
                            VerticalDivider(width: 1, color: Colors.black),
                            Column(
                              children: [
                                Text("${allProducts[index].id}"),
                                Text("${allProducts[index].name}"),
                                Text("${allProducts[index].price} MAD"),
                                Text("${allProducts[index].quantity} Units`"),
                                if(!card.contains(allProducts[index]))
                                TextButton(
                                  onPressed: () {
                                    ref.read(cardProvider.notifier).addProduct(allProducts[index]);
                                  },
                                  child: Text("Add To Card"),
                                )
                                else
                                TextButton(
                                  onPressed: () {
                                    ref.read(cardProvider.notifier).removeProduct(allProducts[index]);
                                  },
                                  child: Text("Remove From Card"),
                                )
                                ,
                              ],
                            ),
                          ],
                        ),
                      ),
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
