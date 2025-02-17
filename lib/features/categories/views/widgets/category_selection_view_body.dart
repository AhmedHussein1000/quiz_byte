import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/cache/cache_keys.dart';
import 'package:quiz_app/core/cache/shared_preferences_helper.dart';
import 'package:quiz_app/core/di/service_locator.dart';
import 'package:quiz_app/core/functions/custom_snack_bar.dart';
import 'package:quiz_app/core/helpers/assets.dart';
import 'package:quiz_app/core/helpers/extensions.dart';
import 'package:quiz_app/core/routes/routes.dart';
import 'package:quiz_app/core/themes/app_colors.dart';
import 'package:quiz_app/core/themes/styles.dart';
import 'package:quiz_app/core/widgets/start_button.dart';
import 'package:quiz_app/features/categories/controllers/categories_controller.dart';

class CategorySelectionViewBody extends StatefulWidget {
  const CategorySelectionViewBody({super.key});

  @override
  State<CategorySelectionViewBody> createState() =>
      _CategorySelectionViewBodyState();
}

class _CategorySelectionViewBodyState extends State<CategorySelectionViewBody> {
  final CategoriesController categoriesController =
      Get.put(CategoriesController(getIt()));
  String? selectedCategory;
  String? selectedDifficulty;

  final List<String> difficulties = ["easy", "medium", "hard"];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          Assets.imagesBg,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome ${SharedPreferencesHelper.getData<String>(key: CacheKeys.usernameKey) ?? ''} 👋',
                  style: Styles.style22Bold(context: context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(() {
                  if (categoriesController.isLoading.value) {
                    return const LinearProgressIndicator(
                      color: kLightGreenColor,
                    );
                  } else if (categoriesController.errorText.value.isNotEmpty) {
                    return Center(
                      child: Text(categoriesController.errorText.value),
                    );
                  } else {
                    return DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Choose Category",
                        labelStyle: const TextStyle(color: kLightGreenColor),
                        border:
                            _customOutlineBorder(borderColor: Colors.white24),
                        focusedBorder:
                            _customOutlineBorder(borderColor: kLightGreenColor),
                      ),
                      value: selectedCategory,
                      items: categoriesController.categories.map((category) {
                        return DropdownMenuItem<String>(
                          value: category.name,
                          child: Text(category.name ?? 'Uncategorize'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      },
                    );
                  }
                }),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Choose Difficulty Level",
                    labelStyle: const TextStyle(color: kLightGreenColor),
                    border: _customOutlineBorder(borderColor: Colors.white24),
                    focusedBorder:
                        _customOutlineBorder(borderColor: kLightGreenColor),
                  ),
                  value: selectedDifficulty,
                  items: difficulties.map((difficulty) {
                    return DropdownMenuItem<String>(
                      value: difficulty,
                      child: Text(difficulty),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDifficulty = value;
                    });
                  },
                ),
                const SizedBox(height: 40),
                StartButton(
                  onTap: () {
                    if (selectedCategory == null ||
                        selectedDifficulty == null) {
                      customSnackBar(
                          context: context,
                          content: 'Please choose category and level');
                    } else {
                      context.pushReplacementNamed(Routes.quiz, arguments: {
                        'category': selectedCategory,
                        'difficulty': selectedDifficulty,
                      });
                    }
                  },
                  btnText: 'Start the Quiz',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

UnderlineInputBorder _customOutlineBorder({Color? borderColor}) =>
    UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? Colors.red));
