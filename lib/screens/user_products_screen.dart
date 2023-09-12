import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';

class UserProductsscreen extends StatelessWidget {
  static const routeName = "/user-products";
  const UserProductsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Products"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, i) => UserProductItem(
              productId: products.items[i].id,
              imageUrl: products.items[i].imageUrl,
              title: products.items[i].title),
          itemCount: products.items.length,
        ),
      ),
    );
  }
}
