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
      home: const MyHomePage(title: 'DatePicker'),
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
  // 별도의 설정 없이도 local time이 표시된다.
  String _selectedDate = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 현재날짜 혹은 선택한 날짜
            Text(
              '$_selectedDate',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () => selectDate(),
                child: const Text(
                  'Show DatePicker',
                  style: TextStyle(fontSize: 24),
                ))
          ],
        ),
      ),
    );
  }

  // 현재날짜를 표시하기 위해 날짜를 구해서 반환
  DateTime selectNowDate() {
    // 현재시간을 구해온다.
    DateTime _now = DateTime.now();
    if (_now.weekday == 6) {
      // 오늘이 토요일이면 2일을 더함
      _now = _now.add(Duration(days: 2));
    } else if (_now.weekday == 7) {
      // 일요일이면 1일을 더함
      _now = _now.add(Duration(days: 1));
    }
    /* 즉 평일인 경우에는 그대로 반환하고, 주말인 경우 다음주 월요일의
    날짜를 구해서 반환하는 기능으로 필요한 경우에만 설정하면 된다. */
    return _now;
  }

  // 특정날짜, 요일 등을 활성화/비활성화 시키는 메서드
  bool _predicate(DateTime day) {
    /* isAfter()와 isBefore()를 통해 활성화 할 날짜의 범위를
    설정할 수 있다. 이때 오늘 날짜가 포함되지 않으면 정상적으로 실행이 되지
    않으므로 반드시 오늘 날짜를 활성화하는 범위에 넣어주어야 한다. */
    if ((day.isAfter(DateTime(2024, 8, 1)) &&
        day.isBefore(DateTime(2024, 9, 1)))) {
      return true; // 활성화시킴
    }

    // 토요일, 일요일 비활성화
    // if (day.weekday != 6 && day.weekday != 7) {
    // 매달 25일 비활성화
    //   if (day != DateTime(day.year, day.month, 25)) {
    //     return true;
    //   }
    //   return true;
    // }

    // 매달 1일부터 리스트에 설정된 날짜까지를 비활성화
    // List days = [1, 2, 3, 4, 5, 6, 7];
    // if (!days.contains(day.day.toInt())) {
    //   return true;
    // }
    return false;
  }

  // DatePicker를 open
  Future selectDate() async {
    DateTime _now = DateTime.now();

    /* 대화창이 표시되는 것은 시간이 걸리는 작업이므로 실행될 때까지
    기다렸다가 표시한다. */
    DateTime? picked = await showDatePicker(
      // initialDatePickerMode: DatePickerMode.year,
      // 초기날짜. 메서드를 통해 표시
      initialDate: selectNowDate(),
      context: context,
      // 선택가능한 년도의 시작 제한(2년 전)
      firstDate: DateTime(_now.year - 2),
      // 선택가능한 년도의 종료 제한(2년 후)
      lastDate: DateTime(_now.year + 2),
      // 달력의 날짜 비활성화 설정(메서드 호출을 통해 설정)
      selectableDayPredicate: _predicate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
            // data: ThemeData.dark(),
            // data: ThemeData.light(),
            data: ThemeData(primaryColor: Colors.pink),
            child: child!);
      },
    );
    // 날짜를 선택한 후 OK를 누를 때 표시된 날짜를 변경한다.
    if (picked != null) {
      setState(() {
        _selectedDate = picked.toString().substring(0, 10);
      });
    }
  }
}
