// 외부 dart파일을 import
import 'package:dart_grammar/d20_class4_get_set2.dart';

void main() {
  // 외부 라이브러리에 정의한 클래스를 통해 인스턴스 생성
  var unit1 = Unit();

  // 멤버변수가 private이므로 접근 불가능
  // unit._age = 30; // error
  // Java에서의 메서드 호출방식으로 사용할 수 없다.
  // unit.age(30); // error
  // 변수에 접근하듯 setter를 호출. JSP의 EL과 유사한 개념으로 사용
  unit1.age = 30;
  // getter도 변수처럼 호출한다.
  print(unit1.age);

  /*
  ..을 통해 메서드를 연속해서 호출할 수 있다.
  인스턴스..setter1..setter2와 같은 형태로 기술한다.
   */
  var unit2 = Unit()
  ..setName('메딕')
  ..setAge(150);
  print("이름: ${unit2.name}, 나이 : ${unit2.age}");

  // 일반적인 메서드 호출방식
  unit2.setName('커맨드센터');
  unit2.setAge(1000);
  print("이름: ${unit2.name}, 나이 : ${unit2.age}");
}