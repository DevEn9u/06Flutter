void main() {
  // Dart는 배열이 없다. List로 사용한다.
  // List : 데이터 순서가 있고 중복 허용

  /*
  List 컬렉션 생성시 <> 안에 사용하는 타입을 명시하여 현재 생성된
  컬렉션에 저장할 데이터의 타입을 지정한다. 즉 타입매개변수를
  사용할 수 있다.
   */
  List<String> list1 = ['a', 'b', 'c', 'a'];
  List<int> list2 = [1, 2, 3, 1];

  // var를 통해서도 list를 생성할 수 있다.
  var list3 = ['a', 'b', 'c', 'a'];
  // list 끝에 데이터 추가
  list3.add('d');
  print(list3); // [a, b, c, a, d]

  // 동일한 데이터가 있다면 앞에 있는 1개가 삭제된다.
  list3.remove('a'); // 앞의 a가 삭제됨
  print(list3); // [b, c, a, d]

  // index는 0부터 시작이므로 3번째 요소가 삭제됨
  list3.removeAt(2); // 해당 index에 위치한 값 삭제됨
  print(list3); // [b, c, d]

  // 일반 for문으로 list에 index로 개별 값에 접근
  for (int i = 0; i < list3.length; i++) {
    print('list3[${i}] -> ${list3[i]}');
  }

  // 확장 for문으로 list의 크기만큼 자동으로 반복한다.
  for (var each in list3) {
    print(each);
  }

  // spread 연산자를 통해 2개의 list를 하나로 연결함
  var list4 = [ ...list2, 5, 6, 7];
  list3.remove('a');
  print(list4);
}