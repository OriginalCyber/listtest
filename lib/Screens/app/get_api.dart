// ignore_for_file: prefer_final_fields, unused_field, unused_local_variable, prefer_const_constructors, duplicate_ignore, library_prefixes, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, unused_element, unnecessary_new, unused_import
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import '../Login/components/background.dart';

class GetAPI extends StatefulWidget {
  const GetAPI({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<GetAPI> createState() => _GetAPIState();
}

class _GetAPIState extends State<GetAPI> {
  var jsonData;
  List<GetAPIData> dataList = [];

  Future<String> _GetAPI() async {
    var response = await Http.get(Uri.parse(
        "https://numvarn.github.io/resume/asset/files/templeprofile.json"));

    jsonData = json.decode(utf8.decode(response.bodyBytes));

    for (var data in jsonData) {
      GetAPIData news = GetAPIData(
          data['อันดับ'],
          data['ชื่อ'],
          data['พระเกจิ'],
          data['รายละเอียด'],
          data['ละติจูด'],
          data['ลองติจูด']);
      dataList.add(news);
    }

    return 'OK';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GET API'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _GetAPI(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // ignore: unnecessary_new
              var data;
              return new Container(
                // ignore: unnecessary_new
                child: new Column(
                  children: <Widget>[
                    Text('อันดับ'),
                    Text('${data['อันดับ']}'),
                    SizedBox(
                      width: 120,
                      height: 50,
                    ),
                    Text('ชื่อ'),
                    Text('${data['ชื่อ']}'),
                    SizedBox(
                      width: 120,
                      height: 50,
                    ),
                    Text('พระเกจิ'),
                    Text('${data['พระเกจิ']}'),
                    SizedBox(
                      width: 120,
                      height: 50,
                    ),
                    Text('รายละเอียด'),
                    Text('${data['รายละเอียด']}'),
                    SizedBox(
                      width: 120,
                      height: 50,
                    ),
                    Text('ละติจูด'),
                    Text('${data['ละติจูด']}'),
                    SizedBox(
                      width: 120,
                      height: 50,
                    ),
                    Text('ลองติจูด'),
                    Text('${data['ลองติจูด']}'),
                  ],
                ),
              );
            } else {
              // ignore: prefer_const_constructors
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class GetAPIData {
  GetAPIData(data, data2, data3, data4, data5, data6);
}
