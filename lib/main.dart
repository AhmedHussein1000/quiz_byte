import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/cache/shared_preferences_helper.dart';
import 'package:quiz_app/core/di/service_locator.dart';
import 'package:quiz_app/core/routes/app_router.dart';
import 'package:quiz_app/core/routes/routes.dart';
import 'package:quiz_app/core/themes/dark_theme.dart';
import 'package:quiz_app/features/quiz/controllers/questions_controller.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await SharedPreferencesHelper.init();
  setupServiceLocator();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuestionsController(getIt()));
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: Routes.welcome,
    );
  }
}
