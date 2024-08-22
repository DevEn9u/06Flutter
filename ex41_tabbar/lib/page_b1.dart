import 'package:ex41_tabbar/page_b2.dart';
import 'package:flutter/material.dart';

class PageB1 extends StatefulWidget {
  const PageB1({super.key});

  @override
  State<PageB1> createState() => _PageB1State();
}

class _PageB1State extends State<PageB1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page B-1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Page B-1',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const PageB2(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
              child: const Text(
                '2페이지 추가',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
