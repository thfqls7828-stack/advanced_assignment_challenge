import 'package:advanced_assignment_challenge/score.dart';

class ScoreStudent extends Score {
  ScoreStudent({required super.score, required this.name});

  final String name;

  @override
  void showInfo() => print("이름 : $name, 점수 : $score");
}
