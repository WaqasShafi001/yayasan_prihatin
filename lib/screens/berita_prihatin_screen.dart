import 'package:flutter/material.dart';

class BeritaPrihatinScreen extends StatelessWidget {
  static const id = 'berita_prihatin_screen';
  final List<String> beritaList = [
    'assets/Berita7.jpg',
    'assets/Berita6.jpg',
    'assets/Berita5.jpg',
    'assets/Berita4.jpg',
    'assets/Berita3.jpg',
    'assets/Berita2.jpg',
    'assets/Berita1.jpg',
  ];
  final List<String> cropList = [
    'assets/Berita7_crop.jpg',
    'assets/Berita6_crop.jpg',
    'assets/Berita5_crop.jpg',
    'assets/Berita4_crop.jpg',
    'assets/Berita3_crop.jpg',
    'assets/Berita2_crop.jpg',
    'assets/Berita1_crop.jpg',
  ];
  final List<String> desc = [
    'MEDAC bakal buka universiti berteraskan koperasi dan keusahawanan',
    'PM mahu Kementerian Pendidikan segerakan program pendigitalan pendidikan negara',
    'KPT sasar 10,000 usahawan pelajar dengan kerjasama Tekun tahun ini',
    'Malaysia beralih ke ekonomi berpendapatan tinggi 5 tahun lagi',
    'MEDAC akan laksana 86 program PKS',
    'PUNB perkenal pembiayaan khas untuk individu mahu mula berniaga',
    'Pembelajaran bersemuka, PdPR perlu seiring'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Berita Prihatin'),
        ),
        body: CustomScrollView(slivers: <Widget>[
          SliverGrid(
            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250.0,
              mainAxisExtent: 300,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.1,
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  child: Hero(
                    tag: 'imageHero + $index',
                    child: Container(
                      width: 150,
                      height: 60,
                      child: Column(
                        children: <Widget>[
                          Image(
                            image: AssetImage(cropList[index]),
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
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                        imagepath: beritaList[index],
                        heroTag: 'imageHero + $index',
                      );
                    }));
                  },
                );
              },
              childCount: cropList.length,
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
        body: SingleChildScrollView(
          child: Column(
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
      ),
    );
  }
}
