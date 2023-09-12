import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl: 'assets/images/tag.png',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl: 'assets/images/figma.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl: 'assets/images/piggy.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'assets/images/percent.png',
    ),
    Product(
      id: 'p5',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'assets/images/percent.png',
    ),
    Product(
      id: 'p6',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'assets/images/percent.png',
    ),
    Product(
      id: 'p7',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'assets/images/percent.png',
    ),
    Product(
      id: 'p8',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'assets/images/percent.png',
    ),
    Product(
      id: 'p9',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'assets/images/percent.png',
    ),
    Product(
      id: 'p10',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'assets/images/percent.png',
    ),
  ];

  // var _showFavouritesOnly = false;

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favItems {
    return _items.where((prodItem) => prodItem.isFavourite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  void addProduct() {
    // _items.add();
    notifyListeners();
  }
/*
  void showFavouritesOnly() {
    _showFavouritesOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavouritesOnly = false;
    notifyListeners();
  }
*/
}
