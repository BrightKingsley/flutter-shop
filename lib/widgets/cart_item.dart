import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_second_app/providers/cart.dart';
import 'package:flutter_second_app/providers/orders.dart';
import 'package:provider/provider.dart';

class CartListItem extends StatefulWidget {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartListItem(
      {super.key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title});

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  DismissDirection dismissDirection = DismissDirection.startToEnd;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final orders = Provider.of<Orders>(context);

    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(10.0),
      child: Dismissible(
        behavior: HitTestBehavior.translucent,
        dismissThresholds: const {
          DismissDirection.startToEnd: 0.3,
          DismissDirection.endToStart: 0.3
        },
        dragStartBehavior: DragStartBehavior.down,
        onUpdate: (details) {
          setState(() {
            dismissDirection = details.direction;
          });
        },
        onDismissed: (dismissed) {
          print("DISMISSED==> $dismissed");
          if (dismissed == DismissDirection.endToStart) {
            cart.removeItem(widget.id);
          } else {
            orders.addOrder([
              CartItem(
                  id: widget.id,
                  price: widget.price,
                  quantity: widget.quantity,
                  title: widget.title)
            ], widget.quantity * widget.price);
            cart.removeItem(widget.id);
          }
        },
        confirmDismiss: (direction) {
          return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: const Text("Are you sure?"),
                    content: Text(
                        dismissDirection == DismissDirection.endToStart
                            ? "Do you want to remove the Item from the cart?"
                            : "Do you want to Order This Item?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(ctx, false);
                          },
                          child: const Text("No")),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(ctx, true);
                          },
                          child: const Text("Yes"))
                    ],
                  ));
        },
        background: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: dismissDirection == DismissDirection.endToStart
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(5)),
          alignment: dismissDirection == DismissDirection.endToStart
              ? AlignmentDirectional.centerEnd
              : AlignmentDirectional.centerStart,
          child: Icon(
            dismissDirection == DismissDirection.endToStart
                ? Icons.delete
                : Icons.payment,
            color: Colors.white,
          ),
        ),
        key: ValueKey(widget.id),
        child: Card(
          margin: const EdgeInsets.all(0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                    child: Text(
                  "\$${widget.price}",
                  style: const TextStyle(color: Colors.white),
                )),
              ),
            ),
            title: Text(widget.title),
            subtitle: Text(
                "Total: \$${(widget.price * widget.quantity).toStringAsFixed(2)} (${widget.quantity}x) "),
            trailing: IconButton(
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {
                cart.addItem(widget.id, widget.price, widget.title);
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}


/**
 * 
 
 * 
 */