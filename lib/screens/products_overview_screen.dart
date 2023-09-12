import 'package:flutter/material.dart';
import 'package:flutter_second_app/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  favourites,
  all;
}

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = "/";

  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavouritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: const Text("MySHop"),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              Positioned(
                  top: 8,
                  left: 2,
                  child: Badge(
                    label: Consumer<Cart>(
                      builder: (_, cart, __) => Text(cart.itemCount.toString()),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  )),
            ],
          ),
          PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onSelected: (selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.favourites) {
                    _showFavouritesOnly = true;
                  } else {
                    _showFavouritesOnly = false;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: FilterOptions.favourites,
                      child: Text("Only Favourites"),
                    ),
                    const PopupMenuItem(
                      value: FilterOptions.all,
                      child: Text("Show All"),
                    ),
                  ])
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(_showFavouritesOnly),
    );
  }
}
