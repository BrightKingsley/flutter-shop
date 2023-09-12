import 'package:flutter/material.dart';
import 'package:flutter_second_app/widgets/order_item.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders";

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Your Orders",
        )),
        drawer: const AppDrawer(),
        body: Center(
          child: orderData.orders.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Image.asset("assets/images/waiting.png"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("You have no available orders")
                  ],
                )
              : ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (ctx, i) => OrderItem(orderData.orders[i])),
        ));
  }
}
