import 'package:advanced_assignment_challenge/score_student.dart';

void printAver(List<ScoreStudent> studentList) {
  final List<int> scores = studentList.map((student) => student.score).toList();
  final avg = scores.reduce((present, next) => present + next) / scores.length;

  print("전체 평균 점수 : $avg");
}
