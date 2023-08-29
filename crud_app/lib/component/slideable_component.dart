import 'package:crud_app/component/todo_list_card.dart';
import 'package:crud_app/component/update_dialog_component.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../controller/delete_api_controller.dart'; // Import your delete controller
import '../model/model.dart';

class SlideAbleComponent extends StatelessWidget {
  final Data product;

  const SlideAbleComponent({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DeleteApiController deleteApiController =
        Get.put(DeleteApiController()); // Use Get.find instead of Get.put

    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            icon: Icons.delete,
            backgroundColor: Colors.purple,
            borderRadius: BorderRadius.circular(12),
            label: "Delete",
            onPressed: (BuildContext context) {
              final productId = product.sId;
              if (productId != null) {
                deleteApiController.deleteProduct(productId);
              } else {
                if (kDebugMode) {
                  print('Product ID is null');
                }
              }
            },
          ),
          const SizedBox(width: 2),
          SlidableAction(
            icon: Icons.edit,
            backgroundColor: Colors.purple,
            borderRadius: BorderRadius.circular(12),
            label: "Edit",
            onPressed: (BuildContext context) {
              // Open the UpdateDialogComponent
              showDialog(
                context: context,
                builder: (_) => UpdateDialogComponent(product: product),
              );
            },
          ),
        ],
      ),
      child: TodoListCard(product: product),
    );
  }
}
