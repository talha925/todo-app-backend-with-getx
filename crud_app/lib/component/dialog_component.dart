import 'package:crud_app/component/text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/post_api_controller.dart';

class DialogComponent extends StatefulWidget {
  const DialogComponent({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DialogComponentState createState() => _DialogComponentState();
}

class _DialogComponentState extends State<DialogComponent> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final controller = Get.put(PostApiController());

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {}
    return FloatingActionButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Product Detail'),
          content: SizedBox(
            height: 200,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  hintText: "Enter your name",
                  controller: nameController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: "Enter your price",
                  controller: priceController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: "Enter your description",
                  controller: descriptionController,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Clear text controllers when "Cancel" is clicked
                nameController.clear();
                priceController.clear();
                descriptionController.clear();
                Navigator.pop(context, 'Cancel');
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Ok');
                controller.addProduct(
                  nameController.text,
                  priceController.text,
                  descriptionController.text,
                );

                // Clear text controllers when "OK" is clicked
                nameController.clear();
                priceController.clear();
                descriptionController.clear();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Icon(Icons.add),
    );
  }
}
