import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projrct01/constants.dart';

import 'package:projrct01/screen/cart_page.dart';
import 'package:projrct01/screen/favorite_page.dart';
import 'package:projrct01/screen/home_page.dart';

import 'package:projrct01/screen/profile_page.dart';
import 'package:projrct01/screen/scan_page.dart';

import '../model/plants.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  // ignore: non_constant_identifier_names
  List<Plant> Favorites = [];
  List<Plant> myCart = [];
  int indexPage = 0;
  List<Widget> widgetList() {
    return [
      const HomePage(),
      FavoritePage(
        favoritedPlants: Favorites,
      ),
      CartPage(
        addToCart: myCart,
      ),
      const ProfilePage(),
    ];
  }

  List<IconData> listIcon = const [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];
  List<String> listTitle = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  style: TextStyle(
                    color: Constants.blackColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  listTitle[indexPage],
                ),
                Icon(
                  Icons.notifications,
                  color: Constants.blackColor,
                  size: 30,
                ),
              ],
            ),
          )),
      body: IndexedStack(
        index: indexPage,
        children: widgetList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
                child: const ScanPage(), type: PageTransitionType.bottomToTop),
          );
        },
        backgroundColor: Constants.primaryColor,
        child: Image.asset(
          'images/code-scan-two.png',
          height: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: 75,
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Constants.primaryColor,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        icons: listIcon,
        activeIndex: indexPage,
        onTap: (p0) {
          setState(() {
            indexPage = p0;
            final List<Plant> favoitedPlant = Plant.getFavoritedPlants();
            final List<Plant> addToCart = Plant.addedToCartPlants();

            Favorites = favoitedPlant;
            myCart = addToCart.toSet().toList();
          });
        },
      ),
    );
  }
}
