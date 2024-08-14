void main() {
  // String 타입 인자 하나만 전달할 수 있다. Java와 동일하다.
  something1('홍길동');

  /* 매개변수의 타입을 지정하지 않아 dynamic이 되므로 모든 타입의 인수를
     전달할 수 있다. */
  something2('전우치');
  something2(30);

  // *** Named Parameters ***

  // 옵션 처리한 메서드이므로 인수를 전달하지 않아도 된다.
  something3();
  something3(name: '손오공');

  /*
  Named Parameters :매개변수의 이름을 통해 인수를 전달할 수 있다.
    따라서 순서를 변경할 수 있으므로, 단순히 순서변경을 위한
    메서드 오버로딩을 할 필요가 없다.
   */
  // 파라미터에 이름을 지정하여 순서없이 인수를 젇달할 수 있다.

  // 뒤의 파라미터만 이름을 주어 값을 전환할 수 있다.
  something4(age: 20);
  something4(name: '유비');
  something4(age: 40, name: "관우");

  something5('해리포터');
  something5('멀린', age: 20);
  // something5(age: 20); // 필수사항인 이름이 누락되어 에러 발생


  something6('이순신');
  something6('강감찬', age: 20);

  something7('권율', age: 30);
}

// Java와 동일하게 정의. 매개변수에 자료형을 명시한다.
void something1(String name) {
  print(name);
}

/* 파라미터의 타입을 생략하면 dynamic 타입이 된다.
   따라서 문자, 숫자 등 모두 전달할 수 있다. */
void something2(name) {
  print(name);
}

// 파라미터를 옵션으로 선언한다.
void something3({String? name}) {
  print('name : $name');
}

// 인수를 순서에 상관없이 전달할 수 있다.
void something4({String? name, int? age}) {
  print('name : $name age : $age');
}

/* 필수 + 옵션 : 이름에 null은 헝묭하지 않으므로 필수사항이고,
  나이는 null을 허용하므로 선택적으로 사용할 수 있다. */
void something5(String name, {int? age}) {
  print('name : $name age : $age');
}

/* 파라미터의 default 값을 지정할 수 있다. 만약 값이 전달되지 않으면
   default로 저장된 값이 할당되므로 '?'을 생략할 수 있다. */
void something6(String name, {int age = 10}) {
  print('name : $name age : $age');
}

// 반드시 필요할 파라미터라면 @required를 사용한다. - 이전 방식
void something7(String name, {required int age}) {
  print('name : $name age : $age');
}

