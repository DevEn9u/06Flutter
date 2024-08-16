class Unit {
  // 멤버변수는 nullable로 선언
  int? health;
  int? move;

  /*
  초기화 리스트 선언
  : 생성자와 동일하지만 default 값을 별도로 명시하여
    생성자의 구현분가 실행되기 전에 인스턴스 변수를 초기화할 수 있다.
   */
  Unit.init() : health = 10, move = 1 {
    // 구현부 없음
  }

  /*
  매개변수 health는 nullable로 선언되어 null값을 허용한다.
  구현부에서는 null인 경우 0으로 초기화되므로 삼항연산자를 사용한다.
   */
  Unit({int? health}) : move = 2 {
    this.health = health ?? 0;
  }
}

// Unit 클래스를 상속
class Marine extends Unit {
  // 자식에서 추가한 멤버변수
  late int attack;

  /*
  초기화 리스트를 통해 1로 초기화하고, 나머지는 부모 생성자를 호출한다.
  super()는 Java와 동일하게 사용할 수 있다.
   */
  Marine({int? health}) : attack = 1, super(health: health) {
    // 구현부 없음
  }
}

void main() {
  // 이름이 있는 생성자를 통해 인스턴스 생성
  Unit unit1 = Unit.init();
  print('unit1.health : ${unit1.health}');
  print('unit1.move : ${unit1.move}');

  print('==================================');

  // 일반적인 생성자를 통해 인스턴스 생성
  Unit unit2 = Unit();
  print('unit2.health : ${unit2.health}');
  print('unit2.move : ${unit2.move}');

  print('==================================');

  // 자식클래스를 통해 인스턴스 생성
  Marine unit3 = Marine();
  print('unit3.health : ${unit3.health}');
  print('unit3.move : ${unit3.move}');
  print('unit3.attack : ${unit3.attack}');

  print('==================================');

  Marine unit4 = Marine(health: 20);
  print('unit4.health : ${unit4.health}');
  print('unit4.move : ${unit4.move}');
  print('unit4.attack : ${unit4.attack}');

}