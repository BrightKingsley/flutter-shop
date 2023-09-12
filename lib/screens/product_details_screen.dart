import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = "/product-detail";

  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Products>(context, listen: false);

    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = provider.findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        // controller: controller,
        child: Column(children: [
          Hero(
            tag: loadedProduct.id,
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                  image: AssetImage(loadedProduct.imageUrl), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "\$${loadedProduct.price}",
            style: const TextStyle(color: Colors.grey, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${loadedProduct.description}",
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
        ]),
      ),
    );
  }
}
