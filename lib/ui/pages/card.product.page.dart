import 'package:ecom_app/ui/pages/cart.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardPage extends ConsumerWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardProducts = ref.watch(cardProvider).toList();
    return  Scaffold(
      appBar: AppBar(
        title: Text("Card"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index)=>ListTile(
                title: Row(
                  children: [
                    Text("${cardProducts[index].name}"),
                  ],
                ),
              ),
              separatorBuilder: (context, index)=> Divider(),
              itemCount: cardProducts.length,
            ),
          )
        ],
      ),
    );
  }
}