import 'package:ex39_navigator3/page3.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  // 파라미터를 전달받을 멤버변수와 생정자 정의
  String data = '';

  // 이전버젼에서 쓰는 생성자 코드
  // Page2({Key? key, required this.data}) : super(key: key);
  // 현재 쓰는 생성자 코드
  Page2({super.key, required this.data});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* 이 버튼을 누르면 Page2가 Stack에서 제거되면서 파라미터를
              보내게 된다. 현재 Page1이 스택 아래쪽에 있는 상태이므로
              파라미터가 전달되게 된다. */
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '2페이지에서 보냄 (Pop)');
              },
              child: const Text(
                '2페이지 제거',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                /* 화면을 전환하면서 파라미터를 전달한다.
                  즉 Page2를 제거하고 Page33이 Stack에 추가되는 형식이
                  된다. 이 경우 1페이지로 다시 돌아오더라도
                  텍스트 widget에 메세지가 출력되지 않는다. */
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        Page3(data: '2페이지에서 보냄(Replacement)'),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
              child: const Text(
                '3페이지로 변경',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
            ),
            // Page1에서 전송한 파라미터를 여기서 출력
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
