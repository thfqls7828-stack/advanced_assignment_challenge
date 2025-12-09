# 🔎 도전 과제: 가상 학생 성적 분석 프로그램
## 프로그래밍 요구사항
- 사용자의 입력을 받아, 메뉴 방식으로 기능 선택
- 1을 입력 시, 우수생(1등)의 정보 출력
- 2를 입력 시, 전체 평균 점수 출력
- 3을 입력 시, 프로그램 종료

## 구현
```dart
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

      studentList.add(ScoreStudent(score: score, name: name));
    }
  } catch (e) {
    print("학생 데이터를 불러오는 데 실패했습니다: ${e.toString()}");
    exit(1);
  }
  return studentList;
}
```

```dart
import 'dart:io';

// 메뉴 선택 함수
int selectMenu() {
  final String? input;
  final int? num;

  print("메뉴를 선택하세요 :");
  print("1. 우수생 출력");
  print("2. 전체 평균 출력");
  print("3. 종료");

  input = stdin.readLineSync();
  if (input == null) return -1;

  num = int.tryParse(input);
  if (num == null) return -1;

  return num;
}
```

```dart
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
```

```dart
import 'package:advanced_assignment_challenge/score_student.dart';

void printAver(List<ScoreStudent> studentList) {
  final List<int> scores = studentList.map((student) => student.score).toList();
  final avg = scores.reduce((present, next) => present + next) / scores.length;

  print("전체 평균 점수 : $avg");
}
```

- 필수 과제와 마찬가지로 txt 파일을 읽어와 studentList에 저장
- 반복문을 통해 사용자에게 3(프로그램 종료)을 입력 받을 때까지 루프 -> selectMenu()
- 1,2,3이 아닌 값이 들어오면 -1을 반환해 "다시 입력하세요" 출력
- 1번, 우수생 출력 : studentList를 점수 순으로 정렬 후, 가장 마지막 학생 출력 -> "같은 점수의 학생이 여러명이면 어떻게 할건데?" 나만의 기능에서 구현할건데.
- 2번, 평균 점수 출력 : list의 map 메서드로 studentList의 점수만 골라 새로운 list 생성, reduce 메서드로 모든 점수의 합을 구하고 list의 길이로 나누어 평균 점수 출력
