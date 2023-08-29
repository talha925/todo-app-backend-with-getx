import 'package:flutter/material.dart';

import '../model/model.dart';

class TodoListCard extends StatelessWidget {
  const TodoListCard({
    super.key,
    required this.product,
  });

  final Data product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text(product.name ?? ""),
        subtitle: Text(product.description ?? ""),
        trailing: Text(
          product.price ?? "",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
