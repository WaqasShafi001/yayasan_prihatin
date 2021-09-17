import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yayasan_prihatin/screens/donation_screen.dart';
import 'package:yayasan_prihatin/screens/news_screen.dart';
import 'package:yayasan_prihatin/app_drawer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'registration_screen.dart';

final List<String> imgList = [
  'https://han.travel/images/cloud/tours/17/intro_photo/putrajaya.jpg',
  'https://images.unsplash.com/photo-1595524803218-fb48dba452dd?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=675&q=80',
  'https://images.unsplash.com/photo-1549154425-7b519f2b92d4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1471&q=80',
  'https://images.unsplash.com/photo-1595085130617-2c436a10cede?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80'
];
final List<String> imgPath = [
  'assets/prihatin.jpg',
  'assets/prihatin_7E.jpg',
  'assets/putrajaya.jpg',
];

final List<String> youtubeURL = [
  'https://www.youtube.com/watch?v=NLGXSo7hQPQ',
  'https://www.youtube.com/watch?v=mBw_GXDGCKM',
  'https://www.youtube.com/watch?v=DaKL4tsb19A',
];
final List<String> yID = ['NLGXSo7hQPQ', 'mBw_GXDGCKM', 'DaKL4tsb19A'];

final List<String> thumbnail = [
  getYoutubeThumbnail(youtubeURL[0]),
  getYoutubeThumbnail(youtubeURL[1]),
  getYoutubeThumbnail(youtubeURL[2]),
];
String getYoutubeThumbnail(String videoUrl) {
  final Uri uri = Uri.tryParse(videoUrl);
  if (uri == null) {
    return null;
  }

  return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
}

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  int _currentVideo = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgPath
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        // Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Image(
                          image: AssetImage(item),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    final List<Widget> videoSliders = thumbnail
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        context: context,
                        builder: (context) =>
                            BottomSheetContainer(url: yID[_currentVideo]),
                      );
                    });
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.network(item, fit: BoxFit.cover, width: 1000.0),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: Text(
                                '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ))
        .toList();
    return Scaffold(
      drawer: AppDrawer(),
      // Disable opening the drawer with a swipe gesture.
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        title: Text('Yayasan Prihatin'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage('assets/logo-prihatin-banner.png'),
                ),
              ),
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.map((url) {
                  int index = imgList.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ),
              Column(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsScreen(),
                        ),
                      );
                    },
                    child: Text('Update@PRIHATIN'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.indigo[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(200, 50),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DonationScreen(),
                        ),
                      );
                    },
                    child: Text('Sumbangan'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.indigo[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(200, 50),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ),
                      );
                    },
                    child: Text('Pendaftaran'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.indigo[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(200, 50),
                    ),
                  ),
                ],
              ),
              CarouselSlider(
                items: videoSliders,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentVideo = index;
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetContainer extends StatefulWidget {
  BottomSheetContainer({this.url});
  final String url;

  @override
  _BottomSheetContainerState createState() => _BottomSheetContainerState();
}

class _BottomSheetContainerState extends State<BottomSheetContainer> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    String id = YoutubePlayer.convertUrlToId(widget.url);
    _controller = YoutubePlayerController(
      initialVideoId: id,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  void listener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Center(
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    _controller.addListener(listener);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
