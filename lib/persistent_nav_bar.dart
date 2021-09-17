import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:yayasan_prihatin/screens/donation_screen.dart';
import 'package:yayasan_prihatin/screens/home_screen.dart';
import 'package:yayasan_prihatin/screens/news_screen.dart';
import 'package:yayasan_prihatin/screens/registration_screen.dart';

BuildContext testContext;

class PersistentNavBar extends StatefulWidget {
  static const String id = 'persistent_nav_bar';
  final BuildContext menuScreenContext;
  PersistentNavBar({Key key, this.menuScreenContext}) : super(key: key);

  @override
  _PersistentNavBarState createState() => _PersistentNavBarState();
}

class _PersistentNavBarState extends State<PersistentNavBar> {
  PersistentTabController _controller;
  bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 1);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      RegistrationScreen(),
      HomeScreen(),
      NewsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.app_registration),
        title: "Pendaftaran",
        activeColorPrimary: Colors.indigo[900],
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: PersistentNavBar.id,
          routes: {
            PersistentNavBar.id: (_) => PersistentNavBar(),
            HomeScreen.id: (_) => HomeScreen(),
            RegistrationScreen.id: (_) => RegistrationScreen(),
            NewsScreen.id: (_) => NewsScreen(),
            DonationScreen.id: (_) => DonationScreen(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: (" "),
        activeColorPrimary: Colors.indigo[900],
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.white,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: PersistentNavBar.id,
          routes: {
            PersistentNavBar.id: (_) => PersistentNavBar(),
            HomeScreen.id: (_) => HomeScreen(),
            RegistrationScreen.id: (_) => RegistrationScreen(),
            NewsScreen.id: (_) => NewsScreen(),
            DonationScreen.id: (_) => DonationScreen(),
          },
        ),
        // onPressed: (context) {
        //   pushDynamicScreen(context,
        //       screen: SampleModalScreen(), withNavBar: true);
        // },
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.article),
        title: ("Update@PRIHATIN"),
        activeColorPrimary: Colors.indigo[900],
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: PersistentNavBar.id,
          routes: {
            PersistentNavBar.id: (_) => PersistentNavBar(),
            HomeScreen.id: (_) => HomeScreen(),
            RegistrationScreen.id: (_) => RegistrationScreen(),
            NewsScreen.id: (_) => NewsScreen(),
            DonationScreen.id: (_) => DonationScreen(),
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        onWillPop: (context) async {
          await showDialog(
            context: context,
            useSafeArea: true,
            builder: (context) => Container(
              height: 50.0,
              width: 50.0,
              color: Colors.white,
              child: ElevatedButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
          return true;
        },
        selectedTabScreenContext: (context) {
          testContext = context;
        },
        hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(
          colorBehindNavBar: Colors.indigo[900],
          borderRadius: BorderRadius.circular(5.0),
        ),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: false,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style15, // Choose the nav bar style with this property
      ),
    );
  }
}
