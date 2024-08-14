void main() {
  // Map : Key, value로 이루어진 데이터
  // 생성1 : JSon 객체 형식으로 Map 생성
  var map1 = {
      'key1' : '홍길동',
      'key2' : 2,
      'key3' : true
  };
  print(map1);

  /*
  생성2: Java와 동일하게 타입매개변수를 이용해서 생성.
   하지만 Dart에서는 인스턴스 생성시 new 키워드를 사용하지 않는다.
   new는 묵시적으로 선언되는 것으로 간주하기 때문이다.
   */
  Map<String, int> map2 = Map();
  map2['홍길동'] = 20;
  map2['전우치'] = 25;
  map2['손오공'] = 30;
  print(map2);

  // 기존의 Key가 있으면 수정, 없으면 추가된다.
  map2['멀린'] = 35; // 추가
  map2['홍길동'] = 21; // 기존값 수정

  // Key를 통해 데이터 삽ㄱ제
  map2.remove('홍길동');
  print(map2);

  /*
  Null Safety : 변수를 선언할 때 null값을 허용할지
   여부를 결정한다.
   int? 변수명 : 해당 변수는 null값을 허용한다.
   int 변수명 : null 값이 입력되면 에러가 발생한다.
   var는 유추형 타입이므로 null이 입력되어도 에러가 발생하지 않는다.
   */

  // 빠르게 값을 찾아오는 것이 목적
  // 에러 발생. map2에는 '홍길동' value가 없기 때문에 바로 에러가 발생한다.
  // int val1 = map2['홍길동'];
  /* null 값을 허용하는 변수로 선언되었으므로 문제 없음. 해당 key는
  앞에서 이미 삭제되었음. */
  int? val1 = map2['홍길동']; // 찾는 값이 없으면 null 반환
  print(val1); // null

  /* null값을 허용하지 않는 변수로 선언됨. 따라서 삼항연산자로
    구분해서 값을 입력한다. */
  int? val2 = map2['홍길동'] ?? -1;
  print(val2); // -1

  /* var는 입력되는 데이터에 따라 타입이 결정되는 유추형이다.
    따라서 null을 입력할 수 있다. */
  var val3 = map2['홍길동'];
  print(val3);  // null
  /* var는 타입이 결정되면 다른 타입으로 변경할 수 없다. 하지만
    앞에서 null이 입력되어 타입이 결정되지 않았으므로 아래와 같이
    데이터를 입력할 수 있다.*/
  val3 = 1; // null이 입력되면 아직 타입이 정해진 것이 아니므로 입력가능.
  print(val3); // 1

  // 해당 map이 해당 key 값을 가지고 있는지 확인
  var bCheck = map2.containsKey('멀린');
  if (bCheck) {
     print('멀린은 존재하는 값입니다.');
  }

  // 반복
  print("=============================");
  // Map의 key를 통해 요소를 출력
  for (var key in map2.keys) {
     print('$key : ${map2[key]}');
  }
  print("=============================");
  // 요소 자체를 인출하여 key와 value를 출력
  for (var e in map2.entries) {
     print('${e.key} : ${e.value}');
  }
  print("=============================");

  // spread 연산자
  var map3 = {
     ...map1,
     'key4' : '전우치'
  };
  print(map3);
}