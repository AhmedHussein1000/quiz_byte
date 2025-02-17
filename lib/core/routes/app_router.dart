import 'package:flutter/material.dart';
import 'package:quiz_app/core/routes/routes.dart';
import 'package:quiz_app/core/widgets/no_route_defined_screen.dart';
import 'package:quiz_app/features/categories/views/category_selection_view.dart';
import 'package:quiz_app/features/quiz/views/quiz_view.dart';
import 'package:quiz_app/features/score/views/score_view.dart';
import 'package:quiz_app/features/welcome/views/welcome_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomeView(),
        );
      case Routes.categorySelection:
        return MaterialPageRoute(
          builder: (_) => const CategorySelectionView(),
        );
      case Routes.quiz:
        String? category;
        String? difficulty;
        if (arguments is Map<String, dynamic>) {
          category = arguments['category'];
          difficulty = arguments['difficulty'];
        }
        return MaterialPageRoute(
          builder: (_) => QuizView(
            category: category!,
            difficulty: difficulty!,
          ),
        );
      case Routes.score:
      
        return MaterialPageRoute(
          builder: (_) => ScoreView(
           
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const NoRouteDefinedScreen(),
        );
    }
  }
}
