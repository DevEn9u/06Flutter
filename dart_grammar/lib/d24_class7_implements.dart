// 2개의 추상클래스 정의
abstract class Greet {
  greet();
}
abstract class Talk {
  talk();
}

// extends는 하나의 클래스만 상속 가능
class Morning extends Greet //, Talk
{
  greet() {
    print("인사");
  }
}
// implements는 여러개의 클래스를 구현 가능
class Evening implements Greet, Talk
{
  greet() {
    print("인사");
  }
  talk() {
    print("대화");
  }
}

void main() {
  Morning m = Morning();
  m.greet();

  Evening e = Evening();
  e.greet();
  e.talk();
}
