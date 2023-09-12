import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/orders.dart' as Ord;

class OrderItem extends StatefulWidget {
  final Ord.OrderItem order;

  const OrderItem(this.order, {super.key});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text("\$${widget.order.amount}"),
          subtitle:
              Text(DateFormat("dd/MM/yyyy hh:mm").format(widget.order.time)),
          trailing: IconButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more)),
        ),
        if (_expanded)
          SizedBox(
            height: min(widget.order.products.length * 20 + 50, 200),
            // height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: ListView(
                  children: widget.order.products
                      .map((product) => Column(
                            children: [
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.title,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${product.quantity}x",
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "\$${product.price}",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ))
                      .toList()),
            ),
          )
      ]),
    );
  }
}
