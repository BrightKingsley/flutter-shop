import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  const ProductsGrid(this.showFavs, {super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favItems : productsData.items;
    // return GridView.builder(
    //   padding: const EdgeInsets.all(5),
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       childAspectRatio: 3 / 2,
    //       mainAxisSpacing: 3,
    //       crossAxisSpacing: 5),
    //   itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
    //     value: products[i],
    //     key: ValueKey(products[i].id),
    //     child: const ProductItem(),
    //   ),
    //   itemCount: products.length,
    // );
    return SizedBox(
      // height: 500,
      child: ListWheelScrollView(
          itemExtent: 200,
          diameterRatio: 3,
          children: products
              .map((product) => ChangeNotifierProvider.value(
                    value: product,
                    key: ValueKey(product.id),
                    child: const ProductItem(),
                  ))
              .toList()),
    );
  }
}
