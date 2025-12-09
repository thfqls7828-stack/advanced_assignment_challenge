import 'package:advanced_assignment_challenge/load_user_data.dart';
import 'package:advanced_assignment_challenge/print_aver.dart';
import 'package:advanced_assignment_challenge/print_rank.dart';
import 'package:advanced_assignment_challenge/score_student.dart';
import 'package:advanced_assignment_challenge/select_menu.dart';

void main(List<String> arguments) async {
  String filePath = "lib/models/student.txt";

  List<ScoreStudent> studentList = await loadStudentData(filePath);

  while (true) {
    int num = selectMenu();

    switch (num) {
      case 1:
        printRank(studentList);
      case 2:
        printAver(studentList);
      case 3:
        print("프로그램을 종료합니다.");
        return;
      default:
        print("다시 입력하세요.");
    }
  }
}
