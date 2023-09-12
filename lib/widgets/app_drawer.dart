import 'package:flutter/material.dart';
import 'package:flutter_second_app/screens/user_products_screen.dart';

import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      width: MediaQuery.of(context).size.width * 0.7,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))),
      child: Column(
        children: [
          AppBar(
            title: const Text("Hello, Friend"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, "/");
            },
            leading: const Icon(Icons.shop),
            title: const Text("Shop"),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, OrdersScreen.routeName);
            },
            leading: const Icon(Icons.payment),
            title: const Text("Orders"),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, UserProductsscreen.routeName);
            },
            leading: const Icon(Icons.person),
            title: const Text("User products"),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
