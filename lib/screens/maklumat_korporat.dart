import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

class MaklumatKorporat extends StatelessWidget {
  static const id = 'maklumat_korporat';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maklumat Korporat'),
      ),
      body: SingleChildScrollView(
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
                      'Maklumat Korporat',
                      style: TextStyle(
                        color: Colors.indigo[800],
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Image(
                      height: 200,
                      image: AssetImage('assets/mk2.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Yayasan Prihatin Nasional (PRIHATIN) merupakan sebuah organisasi kebajikan yang ditubuhkan untuk menyediakan pelbagai bantuan kepada golongan miskin dan tidak berkemampuan terutamanya di kalangan golongan muda ke arah kehidupan yang lebih baik melibatkan 3 teras utama iaitu Pendidikan, Keusahawanan dan Kepimpinan. PRIHATIN turut menjadi penggerak utama membantu kerajaan ke arah memberi impak luar biasa dalam melaksanakan program-program bercorak kemasyarakatan di seluruh pelusuk tanahair.',
                    textAlign: TextAlign.justify,
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'PRIHATIN diurustadbir oleh Lembaga Pemegang Amanah dan diperbadankan melalui Syarikat Berhad Menurut Jaminan (SBMJ). Kekuatan PRIHATIN dapat diterjemah dalam aktiviti-aktiviti kemasyarakatan CSR dan juga program kepimpinan di kalangan mahasiswa, belia dan usahawan muda. Hal ini adalah untuk membangkitkan semangat dan keyakinan anak muda dalam menyelusuri kehidupan yang semakin mencabar.',
                    textAlign: TextAlign.justify,
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'PRIHATIN tidak mempunyai sumber kewangan utama yang tetap dan bagi memastikan dana yang mencukupi, PRIHATIN sentiasa mengalu-alukan sumbangan kewangan daripada individu, agensi kerajaan, sektor swasta dan sebagainya.',
                     textAlign: TextAlign.justify,
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
