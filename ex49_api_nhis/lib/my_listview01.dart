import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class MyListViewPage01 extends StatefulWidget {
  const MyListViewPage01({super.key});

  @override
  State<MyListViewPage01> createState() => _MyListViewPage01State();
}

class _MyListViewPage01State extends State<MyListViewPage01> {
  // 파싱한 병원 정보(데이터) 저장을 위한 List 선언
  late List<HospitalVO> HospitalList;
  // 화면의 렌더링을 위한 변수. setState() 안에서 변경할 것임.
  int stateFlag = 0;

  // 공공 데이처 요청 URL과 파라미터 정리
  String requestURL =
      "https://apis.data.go.kr/openapi/service/rest/HmcSearchService/getRegnHmcList";
  String serviceKeyTxt =
      "m83E0on2TTjwpw2H5Fcj0wD6J6p2pqrG8RH%2B%2FshsbT8FDjSrPlFiI7IyzPrPM%2F78rIlKZUf3s7rRnDZOBBcm2A%3D%3D";
  String hmcNmTxt = ''; // 검진기관명
  String siDoCdTxt = '11'; // 시도 코드
  String siGunGuCdTxt = '410'; // 시군구 코드
  String numOfRowsTxt = '100'; // 검색 개수

  @override
  void initState() {
    super.initState();

    // 앱 실행시 통신을 위한 함수를 호출한다.
    HospitalList = [];
    _getDataParsing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('국민건강보험공단_검진기관 찾기'),
      ),
      // ListView Widget으로 구성
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        // 파싱된 병원정보의 개수만큼 lazy하게 Tile을 생성 후 추가
        itemCount: HospitalList.length,
        itemBuilder: (BuildContext context, int index) {
          return HospitalTile(HospitalList[index]);
        },
      ),
    );
  }

  void _getDataParsing() async {
    String pm1 = 'serviceKey=$serviceKeyTxt';
    String pm2 = 'hmcNm=$hmcNmTxt'; // 검진기관명
    String pm3 = 'siDoCd=$siDoCdTxt'; // 시도 코드
    String pm4 = 'siGunGuCd=$siGunGuCdTxt'; // 시군구 코드
    String pm5 = 'numOfRows=$numOfRowsTxt'; // 출력 개수

    // 공공데이터 API 요청
    var url = Uri.parse("$requestURL?$pm1&$pm2&$pm3&$pm4&$pm5");
    http.Response response = await http.get(
      url,
      headers: {"Accept": "application/xml"},
    );

    // 응답 데이터 저장
    var statusCoDe = response.statusCode;
    var responseBody = utf8.decode(response.bodyBytes);
    // print("statusCode : $statusCoDe");
    // print("responseBody : $responseBody");

    // XML 데이터를 JSON으로 변환
    Xml2Json xml2json = Xml2Json();
    xml2json.parse(responseBody);
    var jsonData = xml2json.toParker();
    print(jsonData);

    var temp = jsonDecode(jsonData);
    // 병원 정보의 node를 찾아 파싱
    List realData = temp['response']['body']['items']['item'];

    for (var item in realData) {
      String cxVl = item['cxVl'].toString();
      String cyVl = item['cyVl'].toString();
      /* fax가 없는 경우가 있으므로 삼항연산자로 null일 경우 처리
        값이 null일 수 있으므로 항상 직접 테스트해봐야함 */
      String exmdrFaxNo = item['exmdrFaxNo'] ?? 'fax없음';
      String exmdrTelNo = item['exmdrTelNo'];
      String hmcNm = item['hmcNm'];
      String locAddr = item['locAddr'];
      String locPostNo = item['locPostNo'];
      String ykindnm = item['ykindnm'];

      // 파싱한 병원 정보는 VO에 저장
      HospitalVO vo = HospitalVO(
        cxVl,
        cyVl,
        exmdrFaxNo,
        exmdrTelNo,
        hmcNm,
        locAddr,
        locPostNo,
        ykindnm,
      );
      // List에 추가
      HospitalList.add(vo);
    }

    print(HospitalList);
    // 렌더링하기 위해 state 변경
    setState(() {
      stateFlag = 1;
    });
  }
}

class HospitalVO {
  String cxVl;
  String cyVl;
  String exmdrFaxNo;
  String exmdrTelNo;
  String hmcNm;
  String locAddr;
  String locPostNo;
  String ykindnm;

  HospitalVO(this.cxVl, this.cyVl, this.exmdrFaxNo, this.exmdrTelNo, this.hmcNm,
      this.locAddr, this.locPostNo, this.ykindnm);
}

// ListTile을 생성하기 위한 클래스 정의
class HospitalTile extends StatelessWidget {
  final HospitalVO _hospitalVO;
  HospitalTile(this._hospitalVO);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // Icons
      leading: Icon(Icons.account_balance),
      // 병원명
      title: Text(
        _hospitalVO.hmcNm,
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent),
      ),
      // 내용 : 주소, 전화번호, 팩스번호
      subtitle: Text(
          "주소: ${_hospitalVO.locAddr}\nTel: ${_hospitalVO.exmdrTelNo}" +
              "\nFax: ${_hospitalVO.exmdrFaxNo}\n"),
      trailing: Icon(Icons.arrow_forward_ios),
      // tap하면 병원명을 console에 출력한다.
      onTap: () {
        print("병원명 : ${_hospitalVO.hmcNm}");
      },
    );
  }
}
