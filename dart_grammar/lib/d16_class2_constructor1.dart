class Unit {
  late String name;
  late int age;
  /*
  기본생성자(이름 없는 생성자)
  - 클래스명과 동일
  - 매개변수 없음
  - 상속관계라면 부모클래스의 기본생성자를 자동으로 호출
  - 개발자가 생성자를 직접 정의하지 않았을 때만 호출
   */
  Unit() {
    this.name = '홍길동';
    this.age = 10;
    print('기본 생성자 호출됨');
  }

  // 이름있는 생성자를 추가할 수 있다.
  Unit.init1(name) {
    this.name = name;
    this.age = 10;
    print('이름있는 생성자 init1 호출됨');
  }

  Unit.init2(name, age) {
    this.name = name;
    this.age = 10;
    print('이름있는 생성자 init2 호출됨');
  }
}

void main() {
  // 각 생성자를 통해 인스턴스 생성
  Unit myUnit1 = Unit();
  Unit myUnit2 = Unit.init1("마린");
  Unit myUnit3 = Unit.init2("마린", 30);

  /*
  리다이렉팅 생성자, 상수 생성자, 팩토리 생성자 등이 있으나
  Dart가 아닌 Flutter가 주 학습이므로 생략
   */

}