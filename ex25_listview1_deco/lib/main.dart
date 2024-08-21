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
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // ListTile click시 리플 효과 색상 변경
        splashColor: Colors.red,
        // 불투명한 색상보다 스플래시 효과를 더 강조한다.
        highlightColor: Colors.black.withOpacity(.5),
      ),
      home: const MyHomePage(title: 'ListView Widget 1'),
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
  var _checkboxValue = false;
  var _radioValue = 0;
  var _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          // 1. 명시적으로 children으로 List를 넘겨서 생성
          children: getMyList(),
        ));
  }

  List<Widget> getMyList() {
    List<Widget> myList = [
      Container(
        // width: double.infinity,  // like Match_parent in Android
        height: 100,
        alignment: Alignment.center,
        color: Colors.amber[600],
        child: Text('onTab이 없어 클릭 안됨', style: TextStyle(fontSize: 30)),
      ),
      ListTile(
        title: Text('Basic #1'),
        subtitle: Text('타이틀과 서브타이틀로만 구성'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          print('Basic #1');
        },
      ),
      Divider(
        color: Colors.black,
        height: 5,
        // indent: 10,
        // endIndent: 10,
      ),
      ListTile(
        leading: FlutterLogo(
          size: 50.0,
        ),
        title: Text('Basic #2'),
        trailing: Icon(Icons.autorenew),
        onTap: () {
          print('Basic #2');
        },
      ),
      Divider(
        color: Colors.black,
        height: 5,
      ),
      ListTile(
        leading: Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: Text('Basic #3'),
        subtitle: Text('기본형의 모든 요소 사용'),
        trailing: Icon(Icons.arrow_back_ios),
        onTap: () {
          print('Basic #3');
        },
      ),
      Divider(
        color: Colors.black,
        height: 5,
      ),
      ListTile(
        leading: Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: Text('Basic #3 - isThreeLine : false'),
        subtitle: Text('내용이 길면 다음 줄로 내용이 넘어간다. 그러나 공간이 확장되지는 않는다.'),
        trailing: Icon(Icons.arrow_back_ios),
        onTap: () {
          print('Basic #3 - isThreeLine : false');
        },
      ),
      Divider(
        color: Colors.black,
        height: 5,
      ),
      ListTile(
        leading: Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: Text('Basic #3 - isThreeLine : true'),
        subtitle: Text('내용이 길면 다음 줄로 내용이 넘어간다. 공간도 같이 한 줄 확장된다.'),
        isThreeLine: true,
        trailing: Icon(Icons.arrow_back_ios),
        onTap: () {
          print('Basic #3 - isThreeLine : true');
        },
      ),
      Divider(
        color: Colors.black,
        height: 5,
      ),
      CheckboxListTile(
        value: _checkboxValue,
        title: Text('CheckBox ListTile'),
        secondary:
            _checkboxValue ? Icon(Icons.thumb_up) : Icon(Icons.thumb_down),
        onChanged: (bool? value) {
          setState(() {
            _checkboxValue = value!;
          });
        },
      ),
      Divider(
        color: Colors.black,
        height: 5,
      ),
      RadioListTile(
        title: Text('GOOD'),
        value: 1,
        groupValue: _radioValue,
        selected: true,
        onChanged: (int? value) {
          setState(() {
            _radioValue = value!;
          });
        },
      ),
      RadioListTile(
        title: Text('NOT GOOD'),
        value: 2,
        groupValue: _radioValue,
        onChanged: (int? value) {
          setState(() {
            _radioValue = value!;
          });
        },
      ),
      Divider(
        color: Colors.black,
        height: 5,
      ),
      SwitchListTile(
        title: Text('Switcdh ListTile'),
        subtitle: Text(_switchValue ? 'on' : 'off'),
        value: _switchValue,
        onChanged: (bool value) {
          setState(() {
            _switchValue = value;
          });
          print('Switch ListTile');
        },
        secondary: Icon(Icons.lightbulb_outline),
      ),
      // click시 리플 효과 표시됨 (Card => ListTile)
      Card(
        color: Colors.amber[100],
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(0),
        ),
        child: ListTile(
          // contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          leading: Icon(
            Icons.account_box,
            size: 50.0,
          ),
          title: Text(
            'Card => ListTile',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          subtitle: Text('클릭시 리플 효과 표시 됨'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            print('fff');
          },
        ),
      ),
      // click시 리플 효과 표시됨 (Card => InkWell)
      Card(
        color: Colors.amber[100],
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(0),
        ),
        child: InkWell(
          // splashColor: Colors.blue,
          child: Row(
            children: [
              SizedBox(
                width: 100,
                height: 150,
                child: Icon(
                  Icons.account_box,
                  size: 50.0,
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Location",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Population: 24.08.21',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.data_usage),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            print('ggg');
          },
        ),
      ),
    ];
    return myList;
  }
}
