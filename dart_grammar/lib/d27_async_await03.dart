Future<int> myAdd(cnt) async {
  int sum = 0;
  // 1초에 한번씩 대기하면서 누적합을 연산한다.
  for (int i = 1; i <= cnt; i++) {
    sum += i;
    print("$i번째 덧셈 결과 : $sum");
    await Future.delayed(Duration(seconds: 1));
  }
  return sum;
}

Future<int> myMinus(cnt) async {
  return await Future(() {
    int rNum = 100;
    for (int i = cnt; i >= 1; i--) {
      rNum -= i;
      print("$i번째 뺄셈 결과 : $rNum");
    }
    return rNum;
  });
}

void main() async {
  print("main 시작");
  int result1 = await myAdd(10);
  print("result1 : $result1");

  await myMinus(10).then((value) {
    print("result2 : $value");
  },
  onError: (e) {
    print('error : $e');
  });
  print("main 종료");
}