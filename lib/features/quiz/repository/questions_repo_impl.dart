import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/core/network/api_constants.dart';
import 'package:quiz_app/core/network/api_service.dart';
import 'package:quiz_app/core/utils/app_constants.dart';
import 'package:quiz_app/features/quiz/models/question_model.dart';
import 'package:quiz_app/features/quiz/repository/base_questions_repo.dart';

class QuestionsRepoImpl extends BaseQuestionsRepo {
  final ApiService apiService;

  QuestionsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<QuestionModel>>> getQuestions(
      {required String category, required String difficulty}) async {
    try {
      final response = await apiService
          .getData(endpoint: ApiConstants.questionsEndPoint, queryParameters: {
        ApiConstants.apiKeyQueryParameter: ApiConstants.apiKey,
        ApiConstants.categoryQueryParameter: category,
        ApiConstants.difficultyQueryParameter: difficulty,
        ApiConstants.limitQueryParameter: ApiConstants.limit
      });
      List<dynamic> jsonQuestion = response.data;
      List<QuestionModel> questions =
          jsonQuestion.map((e) => QuestionModel.fromJson(e)).toList();
      if (questions.isNotEmpty) {
        return Right(questions);
      }
      return const Left(ServerFailure('There are no questions'));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in QuestionsRepoImpl.getQuestions ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }
}
