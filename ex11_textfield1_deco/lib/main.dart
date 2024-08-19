import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TextField 사용 예제'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 멤버변수 : 커스텀 카운터와 입력값 확인
  int _count = 0;
  String _myText = "TextField 사용 예제입니다.";
  // 입력값을 얻어오기 위한 컨트롤러 인스턴스 생성
  final ctlMyText1 = TextEditingController();
  final ctlMyText2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 텍스트 위젯 : 기본문구 출력
            Text(
              _myText,
              style: const TextStyle(fontSize: 30.0),
            ),
            // 간격 조정을 위한 SizedBox
            const SizedBox(
              height: 20,
            ),
            /* 입력값이 없는 TextField. SizedBox를 통해 크기 지정이
            되어있지 않으므로 가로 전체 영역에 표시됨. */
            TextField(
              controller: ctlMyText1,
            ),
            const SizedBox(
              height: 20,
            ),
            // 입력된 텍스트의 길이를 출력하는 커스텀 카운터(개발자 정의)
            Text(
              '$_count / 10',
              style: const TextStyle(
                fontSize: 30.0,
                color: Colors.red,
              ),
            ),
            // TextFiled의 width를 외부(SizedBox를 통해)에서 지정
            SizedBox(
              width: 240,
              child: TextField(
                // 컨트롤러 지정
                controller: ctlMyText2,
                // cursorColor: Colors.red,
                // cursorWidth: 4.0,
                // 입력할 문자의 최대 길이 지정
                maxLength: 10,
                // 입력문자 숨김 처리(Html의 input type="password") 역할
                obscureText: true,
                // 활성화/비활성화
                enabled: true,
                /* 키보드 타입. 텍스트필드에 포커싱되면 자동으로
                키보드가 올라온다. 일반적인 qwerty나 이메일, 숫자형식
                등으로 변경할 수 있다. */
                // keyboardType: TextInputType.number,
                keyboardType: TextInputType.emailAddress,
                // TextField의 테두리나 아이콘에 대한 스타일 설정
                decoration: const InputDecoration(
                  // border: InputBorder.none,
                  // border: OutlineInputBorder(),
                  // 입력을 위해 포커싱되었을 때 border color
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 1.0),
                  ),
                  // 활성화 여부에 따른 border color
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  prefixIcon: Icon(Icons.perm_identity),
                  // 처음 입력되는 값 지정 가능
                  // prefixText: 'PW',
                  // floating label
                  labelText: 'Password',
                  // 입력상자 하단에 효시되는 입력 힌트. placeholder와 다르다!
                  // helperText: '비밀번호를 입력하세요.',
                  /* 입력된 text의 제한 길이와 입력된 길이를 보여주는 옵션으로, 빈값으로 지정하면 숨김처리됨. 주석처리하면
                  박스 하단에 보여진다. */
                  // counterText: "", // maxLength를 감춘다.
                  counterStyle: TextStyle(
                    fontSize: 30.0,
                    color: Colors.yellow,
                  ),
                ),
                // 입력값이 변할 때마다 이벤트 밠뱅
                onChanged: (text) {
                  /* 입력된 text의 길이를 얻어와 변수에 할당 후
                  화면을 새롭게 렌더링한다. */
                  setState(() {
                    _count = text.length;
                  });
                  print('$text - $_count');
                },
                // 포커싱된 상태에서 엔터키를 누르면 이벤트 발생
                onSubmitted: (text) {
                  print('Submitted : $text');
                },
              ),
            ),
            OutlinedButton(
              /* 입력값이 없는 TextField의 내용을 얻어와서 변수에 할당.
              즉 빈 텍스트를 할당하는 것이므로 텍스트를 지운다. */
              onPressed: () {
                setState(() {
                  _myText = ctlMyText1.text;
                });
              },
              child: const Text(
                'Clear Textarea',
                style: TextStyle(fontSize: 24),
              ),
            ), // OutlinedButton
          ],
        ),
      ),
      // floating button을 누르면 입력된 값이 Text Widget에 적용된다.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _myText = ctlMyText2.text;
          });
        },
        tooltip: 'TextField Submit',
        child: const Icon(Icons.send),
      ),
    );
  }
}
