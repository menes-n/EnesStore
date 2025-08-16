import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:enesstore/models/eicons_icons.dart';
import '../screens/cart_page.dart';
import '../screens/favorite_page.dart';
import '../screens/home_page.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
  return StylishBottomBar(
    option: AnimatedBarOptions(
      iconSize: 30,
      barAnimation: BarAnimation.fade,
      iconStyle: IconStyle.animated,
    ),
    items: [
      BottomBarItem(
        icon: Icon(
          Eicons.home,
          size: 35,
          color: currentIndex == 0
              ? const Color.fromRGBO(3, 4, 94, 1)
              : const Color.fromRGBO(0, 119, 182, 1),
        ),
        title: Text(
          'Ana Sayfa',
          style: TextStyle(
            color: currentIndex == 0
                ? const Color.fromRGBO(3, 4, 94, 1)
                : const Color.fromRGBO(0, 119, 182, 1),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      BottomBarItem(
        icon: Icon(
          Eicons.favorite,
          size: 35,
          color: currentIndex == 1
              ? const Color.fromRGBO(3, 4, 94, 1)
              : const Color.fromRGBO(0, 119, 182, 1),
        ),
        title: Text(
          'Favorilerim',
          style: TextStyle(
            color: currentIndex == 1
                ? const Color.fromRGBO(3, 4, 94, 1)
                : const Color.fromRGBO(0, 119, 182, 1),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      BottomBarItem(
        icon: Icon(
          Eicons.shopping_cart,
          size: 35,
          color: currentIndex == 2
              ? const Color.fromRGBO(3, 4, 94, 1)
              : const Color.fromRGBO(0, 119, 182, 1),
        ),
        title: Text(
          'Sepetim',
          style: TextStyle(
            color: currentIndex == 2
                ? const Color.fromRGBO(3, 4, 94, 1)
                : const Color.fromRGBO(0, 119, 182, 1),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    ],
    hasNotch: false,
    currentIndex: currentIndex,
    onTap: (index) {
      if (index == currentIndex) return;
      onTap(index);
      switch (index) {
        case 0:
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MyHomePage()));
          break;
        case 1:
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const FavPage()));
          break;
        case 2:
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SepetimPage()));
          break;
      }
    },
  );
}
}