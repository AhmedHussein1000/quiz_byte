import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/core/helpers/extensions.dart';
import 'package:quiz_app/core/network/api_constants.dart';
import 'package:quiz_app/core/network/api_service.dart';
import 'package:quiz_app/core/utils/app_constants.dart';
import 'package:quiz_app/features/categories/models/category_model.dart';
import 'package:quiz_app/features/categories/repository/base_categories_repo.dart';

class CategoriesRepoImpl extends BaseCategoriesRepo {
  final ApiService apiService;

  CategoriesRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    try {
      final response = await apiService
          .getData(endpoint: ApiConstants.categoriesEndPoint, queryParameters: {
        ApiConstants.apiKeyQueryParameter: ApiConstants.apiKey,
      });
      List<dynamic>? jsonCategories = response.data;

      List<CategoryModel> categories = [];
      if (!jsonCategories.isNullOrEmpty()) {
        for (var category in jsonCategories!) {
          categories.add(CategoryModel.fromJson(category));
        }
         return Right(categories);
      }
        return const Left(ServerFailure('No Categories Found'));
      
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in CategoriesRepoImpl.getAllCategories ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }
}
