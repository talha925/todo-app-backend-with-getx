import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';

class GetApiController extends GetxController {
  final loading = true.obs;
  final products = <Data>[].obs;
  final model = Model().obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/products'));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final List<dynamic> data = responseData['data'];

        products.clear();
        products.addAll(data.map((item) => Data.fromJson(item)));

        model.value =
            Model(message: responseData['message'], data: products.toList());

        loading.value = false;
      } else {
        loading.value = false;
        final responseData = response.body;
        Get.snackbar("Error", responseData);
        if (kDebugMode) {
          print(responseData);
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
