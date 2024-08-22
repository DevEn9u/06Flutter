import 'package:ex41_tabbar/page_a2.dart';
import 'package:flutter/material.dart';

class PageA1 extends StatefulWidget {
  const PageA1({super.key});

  @override
  State<PageA1> createState() => _PageA1State();
}

class _PageA1State extends State<PageA1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page A-1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Page A-1',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => const PageA2()),
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const PageA2(),
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
