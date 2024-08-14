void main() {
  // Set : 데이터 순서가 없고, 중복 허용하지 않음. 로또 같은 느낌

  // 초기값 선언시 중복값이 있을 경우 중복값이 자동으로 제거됨
  // Set<String> set1 = {'c', 'b', 'a', 'a'};
  Set<String> set1 = {'c', 'b', 'a'};
  print(set1);

  // 'a'는 존재하므로 추가되지 않는다.
  set1.add('a');
  set1.add('a');
  // 추가됨
  set1.add('d');
  print(set1);

  // 삭제
  set1.remove('c');
  print(set1);

  // ### 값 존재 유무 체크가 목적 ###
  var bCheck = set1.contains('b');
  if (bCheck) {
    print('b는 존재하는 값입니다.');
  }

  // index로 개별 값 접근
  for (int i = 0; i < set1.length; i++) {
    print('set1[${i}] -> ${set1.elementAt(i)}');
  }

  // 확장 for문으로 index 없이 접근
  for (dynamic each in set1) {
    print(each);
  }

  // spread 연산자
  var set2 = {...set1, 'x', 'y', 'z'};
  print(set2);
}