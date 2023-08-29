import 'package:crud_app/component/dialog_component.dart';
import 'package:crud_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/slideable_component.dart';
import '../controller/get_api_controller.dart';

class HomeScreen extends StatelessWidget {
  final GetApiController getApiController = Get.put(GetApiController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Product List')),
      ),
      body: GetBuilder<GetApiController>(
        builder: (controller) {
          return Obx(() {
            if (controller.loading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.model.value.data == null ||
                controller.model.value.data!.isEmpty) {
              return const Center(
                child: Text('No products available'),
              );
            } else {
              return ListView.builder(
                itemCount: controller.model.value.data!.length,
                itemBuilder: (context, index) {
                  final Data product = controller.model.value.data![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SlideAbleComponent(
                      product: product,
                    ),
                  );
                },
              );
            }
          });
        },
      ),
      floatingActionButton: const DialogComponent(),
    );
  }
}
