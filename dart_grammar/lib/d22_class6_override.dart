// 부모 클래스
class Unit {
  move() {print("이동1");}
  attack() {print("공격1");}
  heal() {print("치료1");}
}

// Unit을 상속한 자식 클래스
class Marine extends Unit {
  // 오버라이딩을 통해 기능 재정의
  move() {
    print("마린 이동");
  }
  /* 오버라이딩을 통해 기능 추가. 부모에 정의된 메서드를
  super에 호출 */
  attack() {
    super.attack();
    print("마린 공격");
  }
  /* annotation 추가 : 오버라이딩 하는 메서드명이 맞는지 체크 */
  @override
  heal() {
    super.heal();
    print("마린 치료");
  }
}

void main() {
  var unit = Marine();
  unit.move();
  unit.attack();
  unit.heal();
}
