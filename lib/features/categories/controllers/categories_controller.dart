import 'package:get/get.dart';
import 'package:quiz_app/features/categories/models/category_model.dart';
import 'package:quiz_app/features/categories/repository/base_categories_repo.dart';

class CategoriesController extends GetxController {
  final BaseCategoriesRepo baseCategoriesRepo;

  CategoriesController(this.baseCategoriesRepo);
  var categories = <CategoryModel>[].obs;
  var isLoading = true.obs;
  var errorText = ''.obs;
  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  void getCategories() async {
    try {
      isLoading(true);
      var result = await baseCategoriesRepo.getAllCategories();
      result.fold((failure) => errorText.value = failure.message,
          (allCategories) => categories.value = allCategories);
    } finally {
      isLoading(false);
    }
  }
}
