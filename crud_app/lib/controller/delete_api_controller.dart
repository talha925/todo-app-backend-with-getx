import 'dart:convert';

import 'package:crud_app/controller/get_api_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DeleteApiController extends GetxController {
  Future<void> deleteProduct(String id) async {
    try {
      final response =
          await http.delete(Uri.parse("http://localhost:3000/product/$id"));

      if (response.statusCode == 200) {
        // Update the products list using the controller
        final getApiController = Get.find<GetApiController>();
        getApiController.products.removeWhere((product) => product.id == id);

        Get.snackbar("Success", "Product deleted successfully");
      } else {
        final responseData = jsonDecode(response.body);
        Get.snackbar("Error", responseData['message']);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }
}
