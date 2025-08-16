import 'package:enesstore/widgets/navigator_bar.dart';
import 'package:enesstore/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(currentIndex: 1, onTap: (index) {}),
      appBar: const CustomAppBar(titleText: 'Favorilerim'),

      body: const Center(child: Text('Favorileriniz şu anda boş.')),
    );
  }
}
