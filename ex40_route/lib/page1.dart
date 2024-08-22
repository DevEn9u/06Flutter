import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  // 멤버변수를 통해 파라미터를 전달받는다.
  String data = '';

  // 필수사항인 경우 required를 추가한다.
  Page1({super.key, required this.data});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                /* Route에서는 push() 대신 pushNamed()를 사용한다.
                  새로운 페이지에서 콜백 데이터가 올 때까지 await한다.
                  결과데이터를 받을 변수는 dynamic으로 선언한다.  */
                // var result = await Navigator.pushNamed(context, '/page2');
                dynamic result = await Navigator.pushNamed(context, '/page2');
                /* Page2가 pop될 때 전달된 콜백데이터가 출력된다.  */
                print('result(from2) : $result');
                /* 버튼을 눌러 Page2를 제거하면 파라미터가 있는 상태이므로
                  문제가 없지만, 좌측 상단의 back 버튼을 눌러 제거하는
                  경우에는 파라미터가 없는 상태이므로 null값이 전달된다.
                  따라서 아래와 같이 null값이 전달된다. 따라서 아래와 같이
                  null값인 경우 처리할 수 있는 코드를 추가해야 한다. */
                setState(() {
                  // widget.data = result as String;
                  var temp = result ?? 'null ㅠㅠ';
                  widget.data = temp as String;
                });
              },
              child: const Text(
                '2페이지 추가',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                /* Page3에 대한 처리도 위와 작동 방식은 동일하다.
                  콜백데이터가 성공적으로 넘어오면 then()절이 실행되어
                  상태가 변경된다. */
                await Navigator.pushNamed(
                  context,
                  '/page3',
                ).then((result) {
                  print('result(from3) : $result');
                  setState(() {
                    // widget.data = result as String;
                    var temp = result ?? 'null이 와써염';
                    widget.data = temp as String;
                  });
                });
              },
              child: const Text(
                '3페이지 추가',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Text(
              widget.data,
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
