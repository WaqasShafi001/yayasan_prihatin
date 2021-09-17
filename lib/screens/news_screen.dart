import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yayasan_prihatin/app_drawer.dart';
import 'package:yayasan_prihatin/models/update_prihatin.dart';
import 'package:yayasan_prihatin/screens/full_news_screen.dart';
import 'package:yayasan_prihatin/services/api_services.dart';

class NewsScreen extends StatefulWidget {
  static const String id = 'news_screen';
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List _items = [];
  UpdatePrihatin _update = UpdatePrihatin();
  APIService _apiService = APIService();
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/update_prihatin.json');
    final data = await json.decode(response);
    print(data);
    setState(() {
      _items = data;
    });
  }

  @override
  void initState() {
    super.initState();

    setState(() {});
  }

  void getUpdate() async {
    _update = await _apiService.getUpdate();
    _items = _update.result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TERKINI@PRIHATIN'),
        ),
        body: FutureBuilder<UpdatePrihatin>(
            future: _apiService.getUpdate(),
            builder:
                (BuildContext context, AsyncSnapshot<UpdatePrihatin> snapshot) {
              if (snapshot.hasData) {
                return CustomScrollView(slivers: <Widget>[
                  SliverGrid(
                    gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400.0,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return GestureDetector(
                            child: Card(
                              margin: EdgeInsets.all(5),
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                child: Column(
                                  children: <Widget>[
                                    Image.network(
                                      snapshot.data.result[index].imgUrl,
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      snapshot.data.result[index].blockTitle,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullNewsScreen(
                                    snapshot.data.result[index].imgUrl,
                                    snapshot.data.result[index].blockTitle,
                                    snapshot.data.result[index].author,
                                    snapshot.data.result[index].fullText,
                                  ),
                                ),
                              );
                            });
                      },
                      childCount: snapshot.data.result.length,
                    ),
                  ),
                ]);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
