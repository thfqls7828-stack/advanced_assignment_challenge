import 'dart:io';

import 'package:advanced_assignment_challenge/score_student.dart';

// txt 파일의 데이터를 List<ScoreStudent>에 담는 함수
Future<List<ScoreStudent>> loadStudentData(String filePath) async {
  List<ScoreStudent> studentList = [];

  try {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    for (var line in lines) {
      final parts = line.split(',');
      if (parts.length != 2) throw FormatException('잘못된 데이터 형식: $line');

      String name = parts[0];
      int score = int.parse(parts[1]);
      studentList = [ScoreStudent(score: score, name: name)];
    }
  } catch (e) {
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    exit(1);
  }
  return studentList;
}
