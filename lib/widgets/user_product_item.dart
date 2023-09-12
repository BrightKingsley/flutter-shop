import 'package:flutter/material.dart';
import 'package:flutter_second_app/screens/edit_products_screen.dart';

class UserProductItem extends StatelessWidget {
  final String productId;
  final String imageUrl;
  final String title;

  const UserProductItem(
      {super.key,
      required this.productId,
      required this.imageUrl,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imageUrl),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        title: Text(title),
        trailing: FittedBox(
          child: Row(children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, EditProductScreen.routeName,
                      arguments: productId);
                },
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).colorScheme.primary,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.secondary,
                )),
          ]),
        ),
      ),
    );
  }
}
