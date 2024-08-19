class Unit {

  /*
  멤버변수를 private으로 선언한다. late를 통해 차후 null이
  아닌 값으로 초기화될 것임을 명시한다.
   */
  late String _name;
  late int _age;

  /*
  자동 메뉴를 이용해서 생성 : 우클릭 > generate > getter and setter
  또는 Alt + insert
  멤버변수 _age의 값을 설정 및 반환한다.
   */
  // getter의 경우 람다형식으로 정의됨
  int get age => _age;

  // get, set 키워드를 사용해서 정의
  set age(int value) {
    _age = value;
  }

  // name에 대한 getter/setter 정의
  String get name {
    return 'My name is $_name.';
  }

  set name(String value) {
    _name = value;
  }

  // 일반 메서드 형식으로 만드는 setter
  void setName(String name) {
    this._name = name;
  }

  void setAge(int age) {
    this._age = age;
  }
}