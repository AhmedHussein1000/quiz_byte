import 'package:quiz_app/features/quiz/models/answers_model.dart';
import 'package:quiz_app/features/quiz/models/correct_answers_model.dart';
import 'package:quiz_app/features/quiz/models/question_model.dart';

const QuestionModel dummyQuestion = QuestionModel(
    id: 3342,
    question: "Which command is used to display system information in Ubuntu?",
    answers: AnswersModel(
        answerA: 'answerA',
        answerB: 'answerB',
        answerC: 'answerC',
        answerD: 'answerD',
        answerE: null,
        answerF: null),
    correctAnswers: CorrectAnswersModel(
        answerACorrect: 'true',
        answerBCorrect: 'true',
        answerCCorrect: 'true',
        answerDCorrect: 'true',
        answerECorrect: 'false',
        answerFCorrect: 'false'),
    explanation: "To display system information, use 'uname -a'.");
const List<QuestionModel> dummyQuestions = [
  dummyQuestion,
  dummyQuestion,
  dummyQuestion,
  dummyQuestion,
  dummyQuestion
];
