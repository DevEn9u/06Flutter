void main() {
  // Future를 익명클래스로 정의
  Future<String> gugudan = Future(() {
    // 실행 후 결과를  String 타입으로 반환
    String result = '';
    for (int i = 2; i <= 9; i++) {
      for (int j = 1; j <= 9; j++) {
        result += '$i * $j = ${i * j} ';
      }
      result += "\n";
    }
    return result;
  });

  // Future 인스턴스를 통해 즉시 실행된 결과를 콜백받아 출력
  gugudan.then((value) {
    print(value);
  },
  onError: (e) {
    print('error : $e');
  });
}