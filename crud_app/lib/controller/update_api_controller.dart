import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UpdateApiController extends GetxController {
  Future<void> updateProduct(
      String id, String name, String price, String description) async {
    try {
      final Map<String, dynamic> requestBody = {
        'name': name,
        'price': price,
        'description': description,
      };

      final response = await http.put(
        Uri.parse("http://localhost:3000/product/$id"),
        body: jsonEncode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Implement your logic here after successful update
        Get.snackbar("Success", "Product updated successfully");
      } else {
        final responseData = jsonDecode(response.body);
        Get.snackbar("Error", responseData['message']);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }
}
