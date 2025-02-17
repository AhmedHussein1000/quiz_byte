import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/features/quiz/models/question_model.dart';

abstract class BaseQuestionsRepo {
  Future<Either<Failure, List<QuestionModel>>> getQuestions(
      {required String category, required String difficulty});
}
