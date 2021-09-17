import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const textStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

class ProgramScreen extends StatefulWidget {
  static const String id = 'program_screen';
  ProgramScreen({this.index});
  final int index;
  @override
  _ProgramScreenState createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  List _programs = [];
  String tajuk = '';
  String image = '';
  String teks = '';
  bool isLoading = true;
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/program.json');
    final data = await json.decode(response);
    print(data);
    setState(() {
      _programs = data;
    });
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      readJson().then((value) {
        tajuk = _programs[widget.index]['tajuk'];
        image = _programs[widget.index]['image'];
        teks = _programs[widget.index]['teks'];
        isLoading = false;
      }).catchError((onError) {
        print(onError.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program 2021'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 100,
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    // '${_programs[widget.index]['tajuk']}',
                    tajuk,
                    style: TextStyle(
                      color: Colors.indigo[800],
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  isLoading
                      ? SizedBox()
                      : Center(
                          child: Image(
                            height: 200,
                            image: AssetImage('$image'),
                          ),
                        ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    teks,
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
