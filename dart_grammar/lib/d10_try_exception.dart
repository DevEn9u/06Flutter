void main() {
  int x = 12;
  int y = 0;
  int res1;
  double res2;

  // on은 exception 객체가 필요없을 때 사용
  try {
    /* Dart는 var, dynamic과 같은 타입이 존재하므로 정수끼리
       나눗셈 연산을 했을 때 실수의 결과가 나올 수 있다. 따라서 아래와
       같이 몫을 구하기 위한 연산자가 별도로 존재한다. */
    res1 = x ~/ y;
  }
  on IntegerDivisionByZeroException {
    // 예외객체 없이 우리가 직접 커스텀한 메세지를 출력한다.
    print('Cannot divide by 0');
  }

  // catch는 exception 객체가 필요할 때 사용
  try {
    /* 0으로 '/' 연산을 진행하면 예외가 발생하지 않고
       Infinity로 출력된다. */
    // res2 = x / y;
    // print(res2);

    /* 나머지를 구하는 '%' 연산을 진행하면 예외가 발생한다. */
    res1 = x % y;
    print(res1);
  }
  on IntegerDivisionByZeroException catch(e) {
    print(e);
  }

  // Java처럼 사용
  try {
    // res2 = x / y;
    // print(res2); // 이 부분은 Infinity가 출력됨

    // 예외가 발생한다.
    res1 = x ~/ y;
  }
  catch(e) {
    print(e);
  }


  /* 해당 함수 내에서 발생된 예외는 즉시 처리하지 않고
     호출한 지점으로 던진다. 여기서 예외처리를 해야하지만,
      별도의 처리가 없으므로 실행이 중지된다.*/
  divide(x, y);
}

// Exception 객체를 throw
divide(int a, int b) {
  if (b == 0) {
    /* 예외가 발생되면 호출한 지점으로 예외객체를 던진다.
       즉 이 위치에서는 예외를 처리하지 않고 무시한다. */
    throw new Exception('Cannot divide by 0 - throw');
  }
  return a / b ;
}