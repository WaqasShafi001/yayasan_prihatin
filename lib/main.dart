import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yayasan_prihatin/persistent_nav_bar.dart';
import 'package:yayasan_prihatin/screens/about_us_screen.dart';
import 'package:yayasan_prihatin/screens/berita_prihatin_screen.dart';
import 'package:yayasan_prihatin/screens/contact_us_screen.dart';
import 'package:yayasan_prihatin/screens/donation_screen.dart';
import 'package:yayasan_prihatin/screens/elemen_prihatin.dart';
import 'package:yayasan_prihatin/screens/fungsi.dart';
import 'package:yayasan_prihatin/screens/home_screen2.dart';
import 'package:yayasan_prihatin/screens/maklumat_korporat.dart';
import 'package:yayasan_prihatin/screens/mutiara_kata.dart';
import 'package:yayasan_prihatin/screens/news_screen.dart';
import 'package:yayasan_prihatin/screens/program_screen.dart';
import 'package:yayasan_prihatin/screens/registration_screen.dart';
import 'package:yayasan_prihatin/screens/splash_screen.dart';
import 'package:yayasan_prihatin/screens/terkini_prihatin_screen.dart';
import 'package:yayasan_prihatin/screens/visi_misi.dart';

import 'bottom_bar_navigation.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'Yayasan Prihatin',
      theme: ThemeData(
          primaryColor: Colors.indigo[800],
          primarySwatch: Colors.indigo,
          unselectedWidgetColor: Colors.grey,
          dividerColor: Colors.transparent),
      initialRoute: SplashScreen.id,
      routes: {
        PersistentNavBar.id: (_) => PersistentNavBar(),
        BottomBarNavigation.id: (_) => BottomBarNavigation(),
        HomeScreen.id: (_) => HomeScreen(),
        RegistrationScreen.id: (_) => RegistrationScreen(),
        NewsScreen.id: (_) => NewsScreen(),
        DonationScreen.id: (_) => DonationScreen(),
        AboutUsScreen.id: (_) => AboutUsScreen(),
        HomeScreen2.id: (_) => HomeScreen2(),
        MutiaraKata.id: (_) => MutiaraKata(),
        BeritaPrihatinScreen.id: (_) => BeritaPrihatinScreen(),
        TerkiniPrihatinScreen.id: (_) => TerkiniPrihatinScreen(),
        MaklumatKorporat.id: (_) => MaklumatKorporat(),
        VisiMisi.id: (_) => VisiMisi(),
        Fungsi.id: (_) => Fungsi(),
        ElemenPrihatin.id: (_) => ElemenPrihatin(),
        ProgramScreen.id: (_) => ProgramScreen(),
        ContactUsScreen.id: (_) => ContactUsScreen(),
        SplashScreen.id: (_) => SplashScreen(),
      },
    );
  }
}
