import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/product.dart';
import '../screens/product_details_screen.dart';
// import '../widgets/app_snackbar.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem(
  //     {super.key,
  //     required this.id,
  //     required this.imageUrl,
  //     required this.title});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.routeName,
            arguments: product.id);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black12,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            leading: Consumer<Product>(
              //NOTE learn how to use this child thingy
              builder: (ctx, product, child) => IconButton(
                  onPressed: () {
                    product.togleFavourite();
                  },
                  icon: Icon(
                    product.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            ),
            trailing: IconButton(
                onPressed: () {
                  cart.addItem(product.id, product.price, product.title);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    content: const Text("Added to cart Successfully"),
                    action: SnackBarAction(label: "UNDO", onPressed: () {}),
                  ));
                },
                icon: Icon(Icons.shopping_cart,
                    color: Theme.of(context).colorScheme.secondary)),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Theme.of(context).colorScheme.secondary, width: 2)),
            child: Hero(
              tag: product.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                    image: AssetImage(product.imageUrl),
                    width: double.infinity,
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
