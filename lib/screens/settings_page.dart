import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';

class AyarlarPage extends StatelessWidget {
  const AyarlarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Ayarlar'),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Profil Bilgileri'),
            subtitle: Text('Ad, e-posta, şifre'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),

          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Bildirimler'),
            subtitle: Text('Push, e-posta tercihleri'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),

          const ListTile(
            leading: Icon(Icons.palette),
            title: Text('Tema'),
            subtitle: Text('Açık / Koyu mod'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Çıkış Yap'),
            onTap: () {
              // Çıkış işlemi burada yapılabilir
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Çıkış Yap'),
                  content: const Text('Hesabınızdan çıkmak istediğinize emin misiniz?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('İptal'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Çıkış işlemi
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: const Text('Çıkış Yap'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}