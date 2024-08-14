void main() {
  // Dart 문법에서는 double quotation과 single quotation을 구분하지 않는다.
  print('Hello');
  print("Hello");

  // 문자열에서 변수를 출력할 때는 $를 이용한다.
  int num = 1;
  print(num);
  print('num의 값은 $num');

  // 수식의 경우에는 중괄호(braces, {})를 사용한다.
  print('1 + 2 = ${1 + 2}');
}