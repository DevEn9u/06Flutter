// 추상클래스를 인터페이스처럼 사용한다.
abstract class Unit {
  // 추상메서드 정의
  move();
}
/*
 extends 혹은 implements는 기능적으로 동일하므로 아래 문장은
 모두 가능하다. 부모의 추상메서드를 오버라이딩 하여 기능을 완성.
 */

class Marine extends Unit {
  move() {
    print("마린 이동");
  }
}

class Medic implements Unit {
  move() {
    print("메딕 이동");
  }
}

void main() {
  // 자식 클래스를 통해 인스턴스 생성 후 메서드 호출
  var unit1 = Marine();
  unit1.move();

  var unit2 = Medic();
  unit2.move();

  // 추상 클래스는 상속을 목적으로 하므로 인스턴스를 생성할 수 없다.
  // var unit3 = Unit();
}