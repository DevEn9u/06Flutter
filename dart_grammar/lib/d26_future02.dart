// 2개의 매개변수로 전달된 값을 더해서 미래에 반환
Future<int> morning(num1, num2) {
  return Future(() {
    int result = num1 + num2;
    return result;
  });
}

// 1 ~ endNum까지의 합을 미래에 반환(비동기로 반환)
Future<int> afternoon(endNum) {
  return Future(() {
    int sum = 0;
    for(int i = 1; i <= endNum; i++) {
      sum += i;
    }
    return sum;
  });
}

void main() {
  print("main 시작");

  /*
   메서드 호출 결과는 Future<int>형이므로 res1은 이와 같이
   유추된다.
   */
  var res1 = morning(1, 2);
  /*
  Future 인스턴스는 Promise와 유사하게 요청에 성공한 경우
  then 절에서 결과를 콜백받는다. 만약 요청에 실패하면 onError절로
  error 인스턴스가 콜백된다.
   */
  res1.then((value) {
    /* Future 인스턴스 내부에서 반환한 int형의 결과가
       value로 콜백된다. */
    print('호출결과1 : $value');
  },
  onError: (err) {
    print('error : $err');
  });

  // 함수의 호출과 동시에 then절을 사용한다. 위와 동일한 방식.
  afternoon(100).then((value) {
    print('호출결과2 : $value');
  },
  onError: (err) {
    print('error : $err');
  });

  /*
  앞에서 호출한 2개의 메서드는 모두 시간이 많이 걸리는
  비동기 작업으로 main이 종료되더라도 실행된 후 결과가
  콜백된 후 프로그램이 종료된다.
   */

  print("main 종료");
}
