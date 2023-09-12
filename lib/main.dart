import 'package:flutter/material.dart';
import 'package:flutter_second_app/screens/edit_products_screen.dart';
import 'package:flutter_second_app/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

import './providers/cart.dart';
import './providers/orders.dart';
import './providers/products.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './screens/product_details_screen.dart';
import './screens/products_overview_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DeliMeals',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                    fontFamily: "Quicksand",
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            // canvasColor: const Color.fromRGBO(255, 254, 229, 1),
            fontFamily: "Quicksand",
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyLarge:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                titleLarge: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Quicksand",
                )),
            colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: Colors.deepPurple)
                .copyWith(secondary: const Color.fromARGB(255, 248, 134, 4))),
        // home: const CategoriesScreen(),
        initialRoute: "/",
        routes: {
          "/": (ctx) => const ProductsOverviewScreen(),
          ProductDetailsScreen.routeName: (ctx) => const ProductDetailsScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          UserProductsscreen.routeName: (ctx) => const UserProductsscreen(),
          EditProductScreen.routeName: (ctx) => const EditProductScreen()
        },
      ),
    );
  }
}
