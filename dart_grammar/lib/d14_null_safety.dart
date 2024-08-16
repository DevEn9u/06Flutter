void main() {
  // ### Nullable && Non-Nullable ###
  print('Non-Nullable과 Nullable');
  // Non-nulllable : null값을 허용하지 않는 변수로 선언
  int num1 = 5;
  // Nullable : null값을 허용하는 변수로 선언
  int? num2 = 2;

  /* Dart에서는 모든 변수를 객체로 처리하므로 일반적인 변수도 null을
     대입할 수 없는 경우가 있다. */
  // num1 = null; // 에러 발생 : Non-Nullable
  num2 = null; // Ok : Nullable

  // 문자열인 경우에도 null에 대한 기본 규칙은 동일
  // String str1 = null; // 에러 발생 : Non-Nullable
  String? str2 = null; // Ok : Nullable


  // ### Null Safety 규칙 ###
  print("Null Safety 규칙");
  /* Non-Nullable 변수는 null로 자동 초기화할 수 없으므로
     초기값 없이 사용하면 Error */
  // int a1;
  // print(a1);

  // Nullable 변수는 선언과 동시에 null로 초기화된다.
  int? a2;
  print('a2 는 $a2');

  // a2 변수는 Nullable. 선언과 동시에 초기값이 null이 대입되어 초기화된다.
  // a1 변수는 Non-Nullable. null로 자동 초기화 할 수 없다.

  /* var 타입은 입력되는 값에 따라 자료형을 유추하게 된다.
     10으로 초기화했으므로 int 타입으로 유추한다. */
  var a3 = 10;
  // int형으로 유추했으므로 Non-Nullable이 되어 null은 허용하지 않는다.
  // a3 = null;
  var a4 = null;  // dynamic으로 유추
  var a5;         // dynamic으로 유추
  /* var로 선언시 Nullable과 Non-Nullable로 자동 유추가 된다. 따라서
     '?' 를 사용할 수 없다. */
  // var? a6 = null; // Error

  /*
  ! : Null Check Operator로 변수 뒤에 '!'을 추가하면 변수값이
      null인 경우 runtime error를 발생시킨다.
   */
  int num3 = 5; // null을 허용하지 않는 변수
  int? num4; // null을 허용하는 변수
  num4 = 10; /* ### 이 부분 주석처리 혹은 활성화 ### */
  num3 = num4; // 컴파일 전 체크하므로 윗 부분이 주석처리 되면 즉시 에러
  num3 = num4!; // 실행 시 체크하므로 runtime error 발생

  /*
  Non-Nullable 변수이므로 null값을 가질 수 없다. 따라서 초기값이 없으면
  다음 줄에서 즉시 error가 발생한다.
   */

  // ?. ?[ ] ?..  => Null Aware Operator
  // String name;
  /*
  Nullable로 선언되었으므로 Null값을 가질 수 있다.
  즉 null로 초기화될 수 있는 상태이다.
   */
  String? name;

  // '?'를 붙이면 Null이 아닐 때 메서드를 실행하고, Null이면 실행하지 않는다.
  name = name?.toLowerCase();

  /*
  n42는 정수가 아니므로 변환시 예외가 발생되어 null 이 반환된다.
  이 경우 삼항연산자에 의해 -1이 할당된다.
   */
  int val2 = int.tryParse('n42') ?? -1;
  print('val2 = $val2');
}