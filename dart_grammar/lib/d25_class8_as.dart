// 부모 클래스 정의
class Unit {
  var health = 10;
}
// Unit을 상속해서 자식클래스 정의
class Marine extends Unit {
  var name = "마린";
}
class Medic extends Unit {
  var name = "메딕";
}

void main() {
  // 자식클래스를 통해 인스턴스 생성
  Marine marine = Marine();
  Medic medic = Medic();

  /*
  as : 다른 타입으로 변환은 되지 않고, 상속간의 상위(부모) 타입으로만
  형변환할 수 있다.
   */
  // 인스턴스의 형변환을 위해 as 사용
  Unit unit1 = marine as Unit;
  // 현재버전에서는 as 없이도 형변환 가능함
  Unit unit2 = medic;

  /*
  is : 특정 타입이 맞을 때, 즉 상속관계가 있을 때 true 반환.
  JavaScript의 instanceOf와 유사하다.
   */
  if (unit1 is Marine) {
    print('마린입니다.');
    /*
     Java에서는 부모타입의 참조변수로 자식쪽의 멤버에 접근할 수 없다.
     하지만 Dart에서는 가능하다. 마치 멤버변수까지 오버라이딩 된다고
     생각하면 된다.
     */
    print(unit1.name);
  }
  else {
    print('마린이 아닙니다.');
  }
  /*
   앞의 if문 블럭에서는 정상동작하지만, 외부로 옮기면 아래와 같이
   에러가 발생한다. 'is'를 통해 부모타입을 자식타입으로 변환할 수
   있는지 확인한 후 접근을 허용한다.
   따라서 아래 문장은 단독으로 사용할 수 없다.
   */
  // print(unit1.name); // error 발생

  // 'as' 없이 대입해도 정상적인 확인이 가능하다.
  if (unit2 is Medic) {
    print('메딕입니다.');
  }
  else {
    print('메딕이 아닙니다.');
  }
}