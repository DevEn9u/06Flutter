// 외부파일 import
import 'package:dart_grammar/d19_class3_private2.dart';

/*
Dart에서는 하나의 파일이 하나의 library이다.
그래서 멤버를 private으로 선언하는 경우 해당 파일 혹은 라이브러리에서만
접근할 수 있다. 외부파일에서는 접근이 불가능하다.
 */
class Unit {
  // 변수명에 '_'를 붙이면 private으로 선언된다.
  late String _name;
  // 일반적인 변수명은 public으로 선언된다.
  late int age;
  // 축약형 생성자
  Unit(this._name, this.age);

  /*
  일반적인 생성자는 아래와 같이 정의하지만,
  Dart에서는 축약형으로 위와 같이 간단히 정의할 수 있다.

    Unit(name, age) {
      this._name = name;
      this.age = age;
    }
   */
}

void main() {
  /*
  * Unit class는 같은 파일(library)에 정의되었으므로 private 멤버도
    접근한 수 있다.

  * Java의 경우에는 에러가 발생한다.
  - 클래스 외부에서는 getter를 통해
    접근해야 한다.
   */
  var unit1 = Unit("마린", 25);
  // private 멤버지만 setter 없이 접근해서 출력할 수 있다.
  print(unit1._name);
  print(unit1.age);

  /*
  Unit2 class의 경우 외부에 정의되었으므로 private 멤버는
  접근할 수 없다.
   */
  var unit2 = Unit2("메딕", 25);
  // print(unit1._name); // error 발생
  // print(unit1.age); // error 발생
}
