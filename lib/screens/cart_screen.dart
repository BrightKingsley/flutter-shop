import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';
import '../providers/cart.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final order = Provider.of<Orders>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // const CircleAvatar(),
                  const Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text("\$${cart.totalAmount}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        final status = order.addOrder(
                            cart.items.values.toList(), cart.totalAmount);
                        if (status) {
                          cart.clear();
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            content: const Text("Order placed Successfully"),
                            action:
                                SnackBarAction(label: "UNDO", onPressed: () {}),
                          ));
                        }
                      },
                      child: const Text("ORDER NOW"))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (cart.items.isNotEmpty)
            Expanded(
                child: ListView.builder(
                    itemCount: cart.itemCount,
                    itemBuilder: (ctx, i) => CartListItem(
                          key: ValueKey(cart.items.values.toList()[i].id),
                          id: cart.items.keys.toList()[i],
                          price: cart.items.values.toList()[i].price,
                          quantity: cart.items.values.toList()[i].quantity,
                          title: cart.items.values.toList()[i].title,
                        )))
        ],
      ),
    );
  }
}
