// 일반적인 메서드 정의. 매개변수 cnt만큼 반복
void morning(cnt) {
  for (int i = 1; i <= cnt; i++) {
    print("morning 호출 $i");
  }
}
/*
Future<void>를 반환하는 메서드로 결과를 미래에 반환하는 개념이다.
매개변수 cnt만큼 반복하는 작업으로 시간이 많이 걸린다고 가정한다.
Future 인스턴스 내부에서는 반환값이 없으므로 타입매개변수는 void로
선언한다.
 */
Future<void> afternoon(cnt) {
  return Future(() {
    int rNum = 0;
    for (int i = 1; i <= cnt; i++) {
      print("afternoon 호출 $i");
    }
  });
}

/*
 cnt초 만큼 대기한 후 콜백함수를 호출한다.
 형식] Future.delayed(대기시간, 콜백함수() {})
 */
void evening(cnt) {
  Future.delayed(Duration(seconds: cnt), () {
    print('$cnt초간 대기후 evening 실행');
  });
}

void main() {
  print("main 시작");
  // 3초간 대기 후 콜백함수를 호출한다.
  evening(3);
  // 10번 반복후 결과를 미래에 반환한다.
  afternoon(10);
  // 일반적인 메서드이므로 호출 즉시 실행한다.
  morning(10);
  print("main 종료");
  /*
   호출한 순서는 위와 같지만 실행되는 순서는
   morning > main끝 >  afternoon > evening 이다.
   Future 인스턴스의 실행은 main 메서드가 종료되어도
   동작되는 Java의 Thread와 유사하다.
   */
}