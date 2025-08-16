import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import 'package:enesstore/models/eicons_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;

  const CustomAppBar({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      titleSpacing: 5,
      backgroundColor: const Color.fromRGBO(0, 119, 182, 1),
      title: Row(
        children: [
          // Sol üstte geri butonu
          IconButton(
            icon: const Icon(Eicons.left_arrow, color: Colors.white, size: 35),
            padding: const EdgeInsets.all(15),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          Text(
            titleText,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
          Spacer(),

          // Sağ üstte logo
          IconButton(
            icon: Image.asset(
              'assets/images/storeLogo.png',
              width: 85,
              height: 85,
            ),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
