import '../widgets/navigator_bar.dart';
import '../widgets/app_bar.dart';
import 'package:flutter/material.dart';
import '../services/cart_manager.dart';
import '../models/product.dart';
import 'package:cart_stepper/cart_stepper.dart';

class SepetimPage extends StatefulWidget {
  const SepetimPage({super.key});

  @override
  State<SepetimPage> createState() => _SepetimPageState();
}

class _SepetimPageState extends State<SepetimPage> {
  List<Product> cartItems = [];

  @override
  void initState() {
    super.initState();
    cartItems = CartManager.getCartItems();
  }

  void removeItem(Product product) {
    setState(() {
      CartManager.removeFromCart(product);
      cartItems = CartManager.getCartItems();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.title} sepetten çıkarıldı'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final visibleItems = cartItems.where((item) => item.count > 0).toList();
    final hiddenItems = cartItems.where((item) => item.count == 0).toList();
    final sortedItems = [...visibleItems, ...hiddenItems];

    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Sepetim'),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: 2,
        onTap: (index) {
          // Navigasyon işlemleri buraya
        },
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Sepetiniz boş.'))
          : ListView(
              children: [
                ...sortedItems.map((product) {
                  return ListTile(
                    leading: Image.network(product.image, width: 50),
                    title: Text(
                      product.title,
                      style: TextStyle(
                        color: product.count == 0 ? Colors.grey : Colors.black,
                        fontStyle: product.count == 0
                            ? FontStyle.italic
                            : FontStyle.normal,
                      ),
                    ),
                    subtitle: Text('${product.price.toStringAsFixed(2)} ₺'),
                    trailing: SizedBox(
                      width: 161,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          product.count == 0
                              ? ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      product.count = 1;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromRGBO(0, 119, 182, 1),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  child: const Text('+ Ekle'),
                                )
                              : Expanded(
                                  child: CartStepperInt(
                                    value: product.count,
                                    size: 30,
                                    style: const CartStepperStyle(
                                      foregroundColor: Colors.black,
                                      activeForegroundColor: Colors.white,
                                      activeBackgroundColor: Color.fromRGBO(0, 119, 182, 1),
                                      border: Border.fromBorderSide(
                                        BorderSide(color: Color.fromRGBO(3, 4, 94, 1),),
                                      ),
                                      radius: Radius.circular(6),
                                      elevation: 2,
                                      buttonAspectRatio: 1.2,
                                    ),
                                    didChangeCount: (count) {
                                      setState(() {
                                        product.count = count;
                                        CartManager.updateItemCount(product, count);
                                      });
                                    },
                                  ),
                                ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => removeItem(product),
                          ),
                        ],
                      ),
                    ),
                    
                  );
                }),
              ],
            ),
    );
  }
}
