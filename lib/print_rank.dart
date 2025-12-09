import 'package:advanced_assignment_challenge/score_student.dart';

void printRank(List<ScoreStudent> studentList) {
  ScoreStudent bestStudent;

  // 이런 방법도 있다.
  // int temp = 0;

  // for (ScoreStudent student in studentList) {
  //   if (student.score > temp) {
  //     bestStudent = student;
  //   }
  // }

  studentList.sort((present, next) => present.score.compareTo(next.score));
  bestStudent = studentList.last;
  print("우수생 : ${bestStudent.name} (점수 : ${bestStudent.score})");
}
