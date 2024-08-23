import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

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
      home: const MyHomePage(title: '공공데이터 파싱'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                getRequest();
              },
              child: const Text(
                '공공데이터 파싱',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getRequest() async {
    // 공공데이터 요청 URL
    var url = Uri.parse(
        "https://apis.data.go.kr/1390802/AgriFood/MzenFoodNutri/getKoreanFoodIdntList?serviceKey=m83E0on2TTjwpw2H5Fcj0wD6J6p2pqrG8RH%2B%2FshsbT8FDjSrPlFiI7IyzPrPM%2F78rIlKZUf3s7rRnDZOBBcm2A%3D%3D&food_Code=D061001");
    
    // 요청시 application/xml로 설정
    http.Response response = await http.get(
      url,
      headers: {"Accept": "application/xml"},
    );

    // 응답받은 XML 데이터
    var statusCode = response.statusCode;
    var responseBody = utf8.decode(response.bodyBytes);

    // XML => JSON으로 변환
    Xml2Json xml2json = Xml2Json();
    xml2json.parse(responseBody);
    var jsonData = xml2json.toParker();
    var myJsonData = jsonDecode(jsonData);
    print("myJsonData : $myJsonData");

    // 파싱을 위한 Node를 찾아서 작성한다.
    var nodeData1 = myJsonData['response']['body']['items']['item'];
    String main_Food_Code = nodeData1['main_Food_Code'];
    String main_Food_Name = nodeData1['main_Food_Name'];
    print("Food_Code : $main_Food_Code");
    print("Food_Name : $main_Food_Name");
    print('======================================');

    // 반복되는 부분은 List로 저장 후 반복해서 파싱
    List nodeData2 = nodeData1['idnt_List'];
    print(nodeData2.length);
    for (var items in nodeData2) {
      String food_Code = items['food_Code'].toString();
      String food_Name = items['food_Name'];

      print("음식 코드와 이름 : $food_Code, $food_Name");
    }
  }
}