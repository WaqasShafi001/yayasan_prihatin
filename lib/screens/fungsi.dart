import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

class Fungsi extends StatelessWidget {
  static const id = 'fungsi';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fungsi'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Fungsi',
                        style: TextStyle(
                          color: Colors.indigo[800],
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      minLeadingWidth: 10,
                      leading: Icon(
                        Icons.fiber_manual_record,
                        size: 15,
                        color: Colors.indigo[900],
                      ),
                      title: Text(
                        'Menerima dan menyalurkan sumbangan kepada pelajar cemerlang melalui program pendidikan mengikut julat pendapatan dalam bentuk biasiswa dan dermasiswa.',
                        textAlign: TextAlign.justify,
                        style: textStyle,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      minLeadingWidth: 10,
                      leading: Icon(
                        Icons.fiber_manual_record,
                        size: 15,
                        color: Colors.indigo[900],
                      ),
                      title: Text(
                        'Mengenalpasti dan memberi peluang kepada pelajar yang kurang berkemampuan dan layak untuk melanjutkan pelajaran ke peringkat lebih tinggi.',
                        textAlign: TextAlign.justify,
                        style: textStyle,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      minLeadingWidth: 10,
                      leading: Icon(
                        Icons.fiber_manual_record,
                        size: 15,
                        color: Colors.indigo[900],
                      ),
                      title: Text(
                        'Melahirkan pelapis di kalangan anak muda terutama graduan untuk menjadi pemimpin masa depan.',
                        textAlign: TextAlign.justify,
                        style: textStyle,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      minLeadingWidth: 10,
                      leading: Icon(
                        Icons.fiber_manual_record,
                        size: 15,
                        color: Colors.indigo[900],
                      ),
                      title: Text(
                        'Menyediakan platform dan bantuan kepada golongan muda yang miskin dan tidak berkemampuan untuk memulakan perniagaan.',
                        textAlign: TextAlign.justify,
                        style: textStyle,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      minLeadingWidth: 10,
                      leading: Icon(
                        Icons.fiber_manual_record,
                        size: 15,
                        color: Colors.indigo[900],
                      ),
                      title: Text(
                        'Mewujudkan kerjasama strategik dengan badan kerajaan dan swasta dalam memastikan objektif PRIHATIN tercapai.',
                        textAlign: TextAlign.justify,
                        style: textStyle,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      minLeadingWidth: 10,
                      leading: Icon(
                        Icons.fiber_manual_record,
                        size: 15,
                        color: Colors.indigo[900],
                      ),
                      title: Text(
                        'Merangka dan melaksanakan program-program yang bersesuaian bagi mendapatkan dana untuk membiayai aktiviti PRIHATIN.',
                        textAlign: TextAlign.justify,
                        style: textStyle,
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
