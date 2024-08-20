/*
 순차적인 비동기 작업을 위해 사용되는 await은 반드시 async와
 같이 사용되어야 한다. 즉 async로 선언된 메서드 내에서 await을
 사용할 수 있다.
 */
Future<void> morning(cnt) async {
  // 시간이 많이 소요되는 작업이 종료될 때까지 기다린다.
  Future.delayed(Duration(seconds: cnt), () {
    print("$cnt초 후 morning 함수 호출");
  });
  // 작업이 종료된 후 결과를 반환한다.
  return Future(() => null);
}

// 위 메서드와 동일하게 구성되어 있다.
Future<void> afternoon(cnt) async {
  return await Future(() {
    int rNum = 0;
    for (int i = 1; i <= cnt; i++) {
      print("afternoon 함수 호출 $i");
    }
  });
}

void main() async {
  /*
   비동기로 시간이 많이 걸리더라도 실행이 종료될 때까지 기다린 후
   다음 작업을 진행하므로 비동기 작업을 동기화 작업처럼 수행할 수
   있게 된다.
   */
  print("main 시작");
  await morning(5);
  await afternoon(10);
  print("main 종료");
}
