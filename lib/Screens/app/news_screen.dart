// ignore_for_file: library_prefixes, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, avoid_print, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_string_interpolations, unused_local_variable, missing_return, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'package:flutter_auth/Screens/Login/components/background.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var jsonData;
  List<THNewsData> dataList = [];

  // ignore: non_constant_identifier_names
  Future<String> _GatNewsAPI() async {
    var respones = await Http.get(Uri.parse(
        'https://numvarn.github.io/resume/asset/files/templeprofile.json'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายชื่อวัด"),
      ),
      body: Background(
        child: FutureBuilder(
          future: _GatNewsAPI(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Card(
                          child: Image.network('${dataList[index].urlToImage}'),
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          margin: EdgeInsets.all(15),
                        ),
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Align(
                            child: Text(
                              '${dataList[index].title}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Align(
                            child: Text(
                              '${dataList[index].description}',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return Container(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class THNewsData {
  String title;
  String description;
  String urlToImage;
  THNewsData(this.title, this.description, this.urlToImage);
}
