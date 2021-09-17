import 'dart:convert';

import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

class ContactUsScreen extends StatelessWidget {
  static const String id = 'contact_us_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hubungi Kami'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Image(
                        image: AssetImage('assets/logo-prihatin-banner.png'),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Alamat:',
                      style: TextStyle(
                        color: Colors.indigo[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'No.129-1, Jln Setia Gemilang BG,',
                      style: textStyle,
                    ),
                    Text(
                      'U13/BG, Setia Alam, 40170 Shah Alam,',
                      style: textStyle,
                    ),
                    Text(
                      'Selangor Darul Ehsan',
                      style: textStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'No Telefon:',
                      style: TextStyle(
                        color: Colors.indigo[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '+603-3358 8612',
                      style: textStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Email:',
                      style: TextStyle(
                        color: Colors.indigo[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'info@yayasanprihatin.com',
                      style: textStyle,
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
