import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/features/categories/models/category_model.dart';

abstract class BaseCategoriesRepo {
  Future<Either<Failure, List<CategoryModel>>> getAllCategories();
}
