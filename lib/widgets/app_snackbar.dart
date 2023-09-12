import 'package:flutter/material.dart';

class AppSnackbar extends StatelessWidget {
  const AppSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      content: const Text("Added to cart Successfully"),
      action: SnackBarAction(label: "UNDO", onPressed: () {}),
    );
  }
}

