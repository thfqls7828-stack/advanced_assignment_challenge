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
