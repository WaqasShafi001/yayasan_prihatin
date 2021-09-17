import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

class LembagaPenasihat extends StatelessWidget {
  static const id = 'lembaga_penasihat';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lembaga Penasihat PRIHATIN'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 2,
              vertical: 5,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 2,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Center(
                    //   child: Text(
                    //     'Lembaga Penasihat Prihatin',
                    //     style: TextStyle(
                    //       color: Colors.indigo[800],
                    //       fontSize: 22,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    Center(
                      child: Image(
                        image: AssetImage('assets/lembaga.png'),
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
