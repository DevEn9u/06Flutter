import 'package:ex40_route/page3.dart';
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
            /* Page2를 제거할 때 파라미터를 전달한다. Page1에서
              열렸으므로 여기로 파라미터가 전달된다. */
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '2페이지에서 보냄 (Pop)');
              },
              child: const Text(
                '2페이지 제거',
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
