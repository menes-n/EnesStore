import 'package:flutter/material.dart';
import 'package:enesstore/widgets/app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Profilim'),
      body: const Center(child: Text('Profil bilgileri burada görünecek.')),
    );
  }
}
