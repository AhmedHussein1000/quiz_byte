import 'package:get_it/get_it.dart';
import 'package:quiz_app/core/network/api_service.dart';
import 'package:quiz_app/features/categories/repository/base_categories_repo.dart';
import 'package:quiz_app/features/categories/repository/categories_repo_impl.dart';
import 'package:quiz_app/features/quiz/repository/base_questions_repo.dart';
import 'package:quiz_app/features/quiz/repository/questions_repo_impl.dart';

final GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerLazySingleton(
    () => ApiService(),
  );
  getIt.registerLazySingleton<BaseCategoriesRepo>(
    () => CategoriesRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<BaseQuestionsRepo>(
    () => QuestionsRepoImpl(getIt()),
  );
}
