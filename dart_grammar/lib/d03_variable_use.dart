void main() {
  int num1 = 1;
  double num2 = 2.1;
  String name = "홍길동";

  // 정수만 인수로 전달 가능
  myFunction1(num1); // 가능
  // myFunction1(num2); // 에러

  myFunction2(num1); // 가능 : num은 int, double의 supertype
  myFunction2(num2); // 가능

  myFunction3(num1); // 가능 : dynamic은 Java에서의 Object 같은 변수
  myFunction3(num2); // 가능
  myFunction3(name); // 가능
}
void myFunction1(int val) {
  print("func1 : $val");
}
void myFunction2(num val) {
  print("func2 : $val");
}
void myFunction3(dynamic val) {
  print("func3 : $val");
}