import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostApiController extends GetxController {
  RxBool loading = false.obs;

  void addProduct(String name, String price, String description) async {
    if (name.isEmpty || price.isEmpty || description.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    loading.value = true;
    try {
      final response = await http.post(
        Uri.parse("http://localhost:3000/product"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "price": price,
          "description": description,
        }),
      );

      if (response.statusCode == 201) {
        loading.value = false;
        Get.snackbar("Success", "Product added successfully");
      } else {
        loading.value = false;
        final responseData = response.body;
        Get.snackbar("Error", responseData);
        if (kDebugMode) {
          print(responseData);
          print(response.statusCode);
        }
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar("Exception", e.toString());
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
