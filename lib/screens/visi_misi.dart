import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

class VisiMisi extends StatelessWidget {
  static const id = 'visi_misi';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visi dan Misi'),
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
                        'Visi dan Misi',
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
                    Center(
                      child: Text(
                        'OBJEKTIF',
                        style: TextStyle(
                          color: Colors.indigo[800],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Memberi kesedaran kepada masyarakat secara amnya dan golongan muda khususnya terhadap kepentingan pendidikan dan keusahawan bagi keluar dari kepompong kemiskinan seterusnya melahirkan pemimpin yang berwibawa.',
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Menanam jatidiri glokal dalam diri setiap individu kerana kualiti kepimpinan tidak bermakna seseorang perlu berada di kedudukan tertinggi – sebaliknya, kepimpinan adalah keupayaan untuk memupuk yang terbaik dalam diri orang lain.',
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        'VISI',
                        style: TextStyle(
                          color: Colors.indigo[800],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Sebagai sebuah organisai berkebajikan unggul yang sentiasa prihatin dan cakna kepada golongan miskin dan tidak berkemampuan.',
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        'Misi',
                        style: TextStyle(
                          color: Colors.indigo[800],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Untuk memupuk generasi muda Malaysia menjadi jejak produktif, bertanggungjawab dan penyayang yang berkembang maju dalam semua aspek kehidupan.',
                      style: textStyle,
                      textAlign: TextAlign.center,
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
