import 'package:flutter/material.dart';

class TerkiniPrihatinScreen extends StatelessWidget {
  static const id = 'terkini_prihatin_screen';
  final List<String> terkiniList = [
    'assets/terkini1.jpg',
    'assets/terkini2.JPG',
    'assets/terkini3.jpg',
    'assets/terkini4.jpg',
    'assets/terkini5.jpg',
    'assets/terkini6.jpg',
    'assets/terkini7.jpg',
    'assets/terkini8.JPG',
    'assets/terkini9.jpg',
    'assets/terkini10.jpg',
    'assets/terkini11.jpg',
  ];
  final List<String> desc = [
    'Kunjungan hormat PRIHATIN kepada YB Menteri MOTAC',
    'Kunjungan hormat PRIHATIN kepada YB Menteri Pembangunan Luar bandar',
    'Sesi mengadap merafak sembah PRIHATIN bersama DULI YANG MAHA MULIA SULTAN SHARAFUDDIN IDRIS SHAH ALHAJ IBNI ALMARHUM SULTAN SALAHUDDIN ABDUL AZIZ SHAH ALHAJ',
    'Kunjungan hormat PRIHATIN kepada YB Menteri Kanan Kerja Raya',
    'Kunjungan hormat PRIHATIN kepada YBhg. Tan Sri Ketua Setiausaha Negara',
    'Kunjungan hormat PRIHATIN kepada Naib Cancelor Universiti Pertahanan Nasional Malaysia (UPNM)',
    'Kunjungan hormat PRIHATIN kepada Naib Cancelor Universiti Pertahanan Nasional Malaysia (UPNM)',
    'Majlis Penyampaian Sumbangan dari Indah Water Konsortium Sdn Bhd (IWK)',
    'Majlis Penyampaian Sumbangan dari Indah Water Konsortium Sdn Bhd (IWK)',
    'Majlis Penyampaian Sumbangan dari Suruhanjaya Perkhidmatan Air Negara (SPAN)',
    'Majlis Penyampaian Sumbangan dari Suruhanjaya Perkhidmatan Air Negara (SPAN)',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Terkini@PRIHATIN'),
        ),
        body: CustomScrollView(slivers: <Widget>[
          SliverGrid(
            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250.0,
              mainAxisExtent: 300,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 1.1,
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  child: Hero(
                    tag: 'imageHero + $index',
                    child: Card(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage(terkiniList[index]),
                                alignment: Alignment.topCenter,
                                fit: BoxFit.cover, // use this
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  desc[index],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                        imagepath: terkiniList[index],
                        heroTag: 'imageHero + $index',
                      );
                    }));
                  },
                );
              },
              childCount: terkiniList.length,
            ),
          ),
        ]));
  }
}

class DetailScreen extends StatelessWidget {
  DetailScreen({this.imagepath, this.heroTag});
  final String imagepath;
  final Object heroTag;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.close_sharp),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            GestureDetector(
              child: Center(
                child: Hero(
                  tag: this.heroTag,
                  child: Image(
                    image: AssetImage(this.imagepath),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
