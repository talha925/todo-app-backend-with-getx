import 'package:crud_app/component/text_field.dart';
import 'package:crud_app/controller/update_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model.dart';

class UpdateDialogComponent extends StatefulWidget {
  final Data product;

  const UpdateDialogComponent({Key? key, required this.product})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UpdateDialogComponentState createState() => _UpdateDialogComponentState();
}

class _UpdateDialogComponentState extends State<UpdateDialogComponent> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final updateController = Get.put(UpdateApiController());

  @override
  void initState() {
    super.initState();
    nameController.text = widget.product.name ?? '';
    priceController.text = widget.product.price ?? '';
    descriptionController.text = widget.product.description ?? '';
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Update Product'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            hintText: "Enter name",
            controller: nameController,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: "Enter price",
            controller: priceController,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: "Enter description",
            controller: descriptionController,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Update');
            updateController.updateProduct(
              widget.product.sId!,
              nameController.text,
              priceController.text,
              descriptionController.text,
            );
            // Clear text controllers after update
            nameController.clear();
            priceController.clear();
            descriptionController.clear();
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
