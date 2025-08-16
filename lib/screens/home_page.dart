import 'package:enesstore/screens/cart_page.dart';
import 'package:enesstore/screens/favorite_page.dart';
import 'package:enesstore/screens/profile_page.dart';
import 'package:enesstore/screens/settings_page.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';
import '../widgets/product_card.dart';
import 'package:enesstore/models/eicons_icons.dart';
import 'package:enesstore/widgets/navigator_bar.dart';

// Ana Sayfa Widget'ı (Stateful)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Ana Sayfa State'i ve Arayüzü
class _MyHomePageState extends State<MyHomePage> {
  // Renk ve filtreleme için değişkenler
  Color cartIconColor = Colors.white;
  Color searchIconColor = Colors.grey;
  Color profileIconColor = Colors.white;
  Color drawerIconColor = const Color.fromRGBO(0, 119, 182, 1);
  Color addCartIconColor = const Color.fromRGBO(0, 119, 182, 1);
  Color unselectedIconColor = Colors.grey;

  List<Product> allProducts = [];
  List<Product> filteredProducts = [];
  String query = "";

  // Sayfa başlatıldığında ürünleri çek
  @override
  void initState() {
    super.initState();
    fetchProducts().then((products) {
      setState(() {
        allProducts = products;
        filteredProducts = products;
      });
    });
  }

  // Arama kutusu değiştiğinde filtreleme işlemi
  void updateSearch(String value) {
    setState(() {
      query = value;
      filteredProducts = allProducts
          .where(
            (product) =>
                product.title.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  // Arayüzün oluşturulması
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(currentIndex: 0, onTap: (index) {}),
      //Sol üstteki menü simgesi
      drawer: Drawer(
        child: Container(
          color: Color.fromRGBO(202, 240, 248, 1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Color.fromRGBO(3, 4, 94, 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 60,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ProfilePage(),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          child: Image.asset(
                            'assets/images/storeLogo02.png',
                            width: 75,
                            height: 75,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Hoş geldin, Enes',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      'Cyber ID: #042',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                  Eicons.home,
                  color: Color.fromRGBO(0, 119, 182, 1),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                title: Text(
                  'Ana Sayfa',
                  style: TextStyle(color: Color.fromRGBO(0, 119, 182, 1)),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Eicons.favorite,
                  color: Color.fromRGBO(0, 119, 182, 1),
                ),
                title: const Text(
                  'Favorilerim',
                  style: TextStyle(color: Color.fromRGBO(0, 119, 182, 1)),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const FavPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Eicons.shopping_cart,
                  color: Color.fromRGBO(0, 119, 182, 1),
                ),
                title: const Text(
                  'Sepetim',
                  style: TextStyle(color: Color.fromRGBO(0, 119, 182, 1)),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const SepetimPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Eicons.user,
                  color: Color.fromRGBO(0, 119, 182, 1),
                ),
                title: const Text(
                  'Profil',
                  style: TextStyle(color: Color.fromRGBO(0, 119, 182, 1)),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const ProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Eicons.settings,
                  color: Color.fromRGBO(0, 119, 182, 1),
                ),
                title: const Text(
                  'Ayarlar',
                  style: TextStyle(color: Color.fromRGBO(0, 119, 182, 1)),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const AyarlarPage()),
                  );
                },
              ),
              const Divider(color: Colors.white54),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: const Text(
                  'Çıkış Yap',
                  style: TextStyle(color: Colors.redAccent),
                ),
                onTap: () {
                  // Çıkış işlemi burada yapılabilir
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Çıkış Yap'),
                      content: const Text(
                        'Hesabınızdan çıkmak istediğinize emin misiniz?',
                      ),
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
        ),
      ),

      // Uygulama üst barı (AppBar)
      appBar: AppBar(
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(Eicons.menu, color: Colors.black, size: 35),
                ),
              ),
            ),
          ),
        ),

        toolbarHeight: 80,
        titleSpacing: 5,
        backgroundColor: const Color.fromRGBO(0, 119, 182, 1),
        title: Row(
          children: [
            // Sol üstte logo
            SizedBox(
              width: 78,
              height: 78,
              child: Image.asset(
                'assets/images/storeLogo.png',
                fit: BoxFit.cover,
              ),
            ),
            // Arama kutusu
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(3.0),
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Eicons.search,
                        size: 35,
                        color: searchIconColor,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: updateSearch,
                        decoration: const InputDecoration(
                          hintText: 'Aradığınız ürünü yazın...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Ana içerik (body)
      body: Container(
        color: const Color.fromRGBO(202, 240, 248, 1),
        child: allProducts.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              ) // Yükleniyor animasyonu
            : filteredProducts.isEmpty
            ? const Center(
                child: Text('Aradığınız ürün bulunamadı.'),
              ) // Sonuç yoksa mesaj
            : ListView.builder(
                itemCount: filteredProducts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // Ürünler başlığı
                    return Container(
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: const Text(
                        "ÜRÜNLER",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  final product = filteredProducts[index - 1];
                  // Ürün kartı
                  return ProductCard(
                    product: product,
                    addCartIconColor: addCartIconColor,
                  );
                },
              ),
      ),
    );
  }
}
