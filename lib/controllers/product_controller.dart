import 'package:get/get.dart';

import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductController extends GetxController {
  var productsList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onReady() async {
    super.onReady();

    try {
      isLoading.value = true;
      var products = await APIService.fetchProducts();
      if (products != null) {
        productsList.value = products;
      }
      isLoading.value = false;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      isLoading.value = false;
    }
  }
}
