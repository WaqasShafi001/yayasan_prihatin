import 'package:flutter/material.dart';
import 'package:yayasan_prihatin/bottom_bar_navigation.dart';
import 'package:yayasan_prihatin/screens/about_us_screen.dart';
import 'package:yayasan_prihatin/screens/berita_prihatin_screen.dart';
import 'package:yayasan_prihatin/screens/contact_us_screen.dart';
import 'package:yayasan_prihatin/screens/donation_screen.dart';
import 'package:yayasan_prihatin/screens/elemen_prihatin.dart';
import 'package:yayasan_prihatin/screens/fungsi.dart';
import 'package:yayasan_prihatin/screens/home_screen.dart';
import 'package:yayasan_prihatin/screens/lembaga_penasihat_screen.dart';
import 'package:yayasan_prihatin/screens/maklumat_korporat.dart';
import 'package:yayasan_prihatin/screens/mutiara_kata.dart';
import 'package:yayasan_prihatin/screens/news_screen.dart';
import 'package:yayasan_prihatin/screens/program_screen.dart';
import 'package:yayasan_prihatin/screens/registration_screen.dart';
import 'package:yayasan_prihatin/screens/terkini_prihatin_screen.dart';
import 'package:yayasan_prihatin/screens/visi_misi.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'screens/home_screen2.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 60.0,
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.indigo[900],
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(top: 5, left: 20),
              leading: Icon(
                Icons.home_outlined,
                color: Colors.indigo[800],
              ),
              title: Text(
                'Halaman Utama',
                style: TextStyle(
                  color: Colors.indigo[800],
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomBarNavigation(),
                  ),
                );
              },
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 1,
              color: Colors.grey,
              height: 1,
            ),
            ExpansionTile(
              tilePadding: EdgeInsets.only(
                top: 5,
                left: 20,
                right: 20,
              ),
              leading: Icon(
                Icons.group_outlined,
                color: Colors.indigo[800],
              ),
              title: Text(
                'Mengenai Kami',
                style: TextStyle(
                  color: Colors.indigo[800],
                ),
              ),
              children: <Widget>[
                ListTile(
                  leading: SizedBox(),
                  title: Text(
                    'Mutiara Kata Pengerusi',
                    style: TextStyle(
                      color: Colors.indigo[800],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MutiaraKata(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: SizedBox(),
                  title: Text(
                    'Maklumat Korporat',
                    style: TextStyle(
                      color: Colors.indigo[800],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MaklumatKorporat(),
                      ),
                    );
                  },
                ),
                // ListTile(
                //   leading: SizedBox(),
                //   title: Text(
                //     'Lembaga Penasihat',
                //     style: TextStyle(
                //       color: Colors.indigo[800],
                //     ),
                //   ),
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => LembagaPenasihat(),
                //       ),
                //     );
                //   },
                // ),
                ListTile(
                  leading: SizedBox(),
                  title: Text(
                    'Visi dan Misi',
                    style: TextStyle(
                      color: Colors.indigo[800],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VisiMisi(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: SizedBox(),
                  title: Text(
                    'Fungsi',
                    style: TextStyle(
                      color: Colors.indigo[800],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Fungsi(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: SizedBox(),
                  title: Text(
                    'Elemen Prihatin',
                    style: TextStyle(
                      color: Colors.indigo[800],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ElemenPrihatin(),
                      ),
                    );
                  },
                ),
              ],
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 1,
              color: Colors.grey,
              height: 1,
            ),
            ExpansionTile(
              tilePadding: EdgeInsets.only(
                top: 5,
                left: 20,
                right: 20,
              ),
              leading: Icon(
                Icons.event_outlined,
                color: Colors.indigo[800],
              ),
              title: Text(
                'Program 2021',
                style: TextStyle(
                  color: Colors.indigo[800],
                ),
              ),
              children: <Widget>[
                ListTile(
                  leading: SizedBox(),
                  title: Text(
                    'Jelajah Pendidikan Prihatin',
                    style: TextStyle(
                      color: Colors.indigo[800],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProgramScreen(index: 0),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: SizedBox(),
                  title: Text(
                    'Jelajah Prihatin Covid-19',
                    style: TextStyle(
                      color: Colors.indigo[800],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProgramScreen(index: 1),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: SizedBox(),
                  title: Text(
                    'Konvensyen Pendidikan Bumiputra',
                    style: TextStyle(
                      color: Colors.indigo[800],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProgramScreen(index: 2),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: SizedBox(),
                  title: Text(
                    'Akademi Kepimpinan Prihatin',
                    style: TextStyle(
                      color: Colors.indigo[800],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProgramScreen(index: 3),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: SizedBox(),
                  title: Text(
                    'Tuisyen Prihatin Perdana',
                    style: TextStyle(
                      color: Colors.indigo[800],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProgramScreen(index: 4),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: SizedBox(),
                  title: Text(
                    'Program Prihatin Rakyat',
                    style: TextStyle(
                      color: Colors.indigo[800],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProgramScreen(index: 5),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: SizedBox(),
                  title: Text(
                    'Tabung Pendidikan Anak Bangsa',
                    style: TextStyle(
                      color: Colors.indigo[800],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProgramScreen(index: 6),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: SizedBox(),
                  title: Text(
                    'Mengubah Destini Orang Asli (MDOA)',
                    style: TextStyle(
                      color: Colors.indigo[800],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProgramScreen(index: 7),
                      ),
                    );
                  },
                ),
              ],
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 1,
              color: Colors.grey,
              height: 1,
            ),
            // ListTile(
            //   contentPadding: EdgeInsets.only(top: 5, left: 20),
            //   leading: Icon(
            //     Icons.article_outlined,
            //     color: Colors.indigo[800],
            //   ),
            //   title: Text(
            //     'Terkini@PRIHATIN',
            //     style: TextStyle(
            //       color: Colors.indigo[800],
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => TerkiniPrihatinScreen(),
            //       ),
            //     );
            //   },
            // ),
            // Divider(
            //   indent: 20,
            //   endIndent: 20,
            //   thickness: 1,
            //   color: Colors.grey,
            //   height: 1,
            // ),
            // ListTile(
            //   contentPadding: EdgeInsets.only(top: 5, left: 20),
            //   leading: Icon(
            //     Icons.article_outlined,
            //     color: Colors.indigo[800],
            //   ),
            //   title: Text(
            //     'Berita@PRIHATIN',
            //     style: TextStyle(
            //       color: Colors.indigo[800],
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => BeritaPrihatinScreen(),
            //       ),
            //     );
            //   },
            // ),
            // Divider(
            //   indent: 20,
            //   endIndent: 20,
            //   thickness: 1,
            //   color: Colors.grey,
            //   height: 1,
            // ),

            ListTile(
              contentPadding: EdgeInsets.only(top: 5, left: 20),
              leading: Icon(
                Icons.app_registration,
                color: Colors.indigo[800],
              ),
              title: Text(
                'Peluang Pendidikan',
                style: TextStyle(
                  color: Colors.indigo[800],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationScreen(),
                  ),
                );
              },
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 1,
              color: Colors.grey,
              height: 1,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(top: 5, left: 20),
              leading: Icon(
                Icons.card_giftcard,
                color: Colors.indigo[800],
              ),
              title: Text(
                'Sumbangan Korporat',
                style: TextStyle(
                  color: Colors.indigo[800],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DonationScreen(),
                  ),
                );
              },
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 1,
              color: Colors.grey,
              height: 1,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(top: 5, left: 20),
              leading: Icon(
                Icons.phone_outlined,
                color: Colors.indigo[800],
              ),
              title: Text(
                'Hubungi Kami',
                style: TextStyle(
                  color: Colors.indigo[800],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUsScreen(),
                  ),
                );
              },
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 1,
              color: Colors.grey,
              height: 1,
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        size: 20,
                        color: Colors.indigo[800],
                      ),
                      onPressed: () async {
                        var _url = 'https://www.facebook.com/prihatinonline/';
                        await canLaunch(_url)
                            ? await launch(_url)
                            : throw 'Could not launch $_url';
                      }),
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.instagram,
                        size: 20,
                        color: Colors.indigo[800],
                      ),
                      onPressed: () async {
                        var _url = 'https://www.instagram.com/prihatinonline/';
                        await canLaunch(_url)
                            ? await launch(_url)
                            : throw 'Could not launch $_url';
                      }),
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.twitter,
                        size: 20,
                        color: Colors.indigo[800],
                      ),
                      onPressed: () async {
                        var _url = 'https://twitter.com/prihatinonline';
                        await canLaunch(_url)
                            ? await launch(_url)
                            : throw 'Could not launch $_url';
                      }),
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.youtube,
                        size: 20,
                        color: Colors.indigo[800],
                      ),
                      onPressed: () async {
                        var _url =
                            'https://youtube.com/channel/UCk3ZM-ZpEa5NlVcI5M1QqJQ';
                        await canLaunch(_url)
                            ? await launch(_url)
                            : throw 'Could not launch $_url';
                      }),
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.tiktok,
                        color: Colors.indigo[800],
                        size: 20,
                      ),
                      onPressed: () async {
                        var _url = 'https://vt.tiktok.com/ZSJ6sVQNU/';
                        await canLaunch(_url)
                            ? await launch(_url)
                            : throw 'Could not launch $_url';
                      }),
                ],
              ),
              onTap: () {},
            ),
            SizedBox(),

            // Container(
            //   height: 70.0,
            //   child: Center(
            //     child: Text(
            //       'Copyright © 2021 Yayasan Prihatin Nasional',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 13.0,
            //       ),
            //     ),
            //   ),
            //   decoration: BoxDecoration(
            //     color: Colors.indigo[900],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
