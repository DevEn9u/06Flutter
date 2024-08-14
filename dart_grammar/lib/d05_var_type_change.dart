void main() {

  // ### 정수, 실수간 변환 ###
  int num1 = 10;
  // 실수형으로 변환
  double num2 = num1.toDouble();
  // 정수형으로 변환
  num1  = num2.toInt();

  // ### 문자를 숫자로 변환 ###
  /*
  만약 문자열을 숫자형으로 변환하지 못해 예외가 발생되면
  그 즉시 실행은 종료된다. 아래 문자열을 '10x'와 같이 변경한 후
  실행하면 에러 확인 가능
   */
  int intVal = int.parse('10'); // 실패시 Exception
  double doubleVal = double.parse('10.1');

  /*
  parse() 함수는 자체적인 예외처리 기능이 없으므로 아래와 같이
  try~catch와 함께 사용하는 것을 권장한다.
   */
  try {
    var num3 = int.parse('n42'); // 여기서 예외 발생
    print(num3);
  } on FormatException catch(e) { // 예외 발생 즉시 catch절로 이동
    print('format error! - 포맷 에러 발생!');
    print(e);
  }

  /*
  형변환에 실패하는 경우 null이 반환된다. '10x'로 수정한 후
  출력하면 null이 출력된다.
  즉 자체적인 예외처리 기능을 가지고 있다.
   */
  int? intVal2 = int.tryParse('10'); // 실패시 null
  double? doubleVal2 = double.tryParse('10.1');

  /*
  삼항연산자 형태로 앞부분에서 예외가 발생되면 ?? 뒷부분의
  값이 변수에 할당된다.
   */
  int val1 = int.tryParse('n42') ?? -1;
  // 예외가 발생되므로 -1 할당됨
  print('val1 = $val1');
  // 예외가 발생되므로 null 할당됨
  var val2 = int.tryParse('n42');
  print('val2 = $val2');

  // ### 진법 변환 - 잘 사용되지 않으므로 참고만 한다. ###

  var n_16 = int.parse('FF', radix: 16); // 255
  print('n_16 : FF => $n_16');
  var n_8 = int.parse('10', radix: 8); // 8
  print('n_8 : 10 => $n_8');
  var n_2 = int.parse('1001', radix: 2); // 9
  print('n_2 : 1001 => $n_2');

  int baseNum = 10;
  var val3 = baseNum.toRadixString(16);
  print('10 hex => 0x$val3');
  var val4 = baseNum.toRadixString(2);
  print('10 hex => 0b$val4');

}