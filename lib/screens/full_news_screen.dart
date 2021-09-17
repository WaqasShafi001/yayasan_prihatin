import 'package:flutter/material.dart';

class FullNewsScreen extends StatelessWidget {
  FullNewsScreen(this.image, this.headline, this.author, this.fullText);
  final String image;
  final String headline;
  final String author;
  final String fullText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('TERKINI@PRIHATIN'),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  this.headline,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Image.network(this.image),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Oleh: ${this.author}",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  this.fullText,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
