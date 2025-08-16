import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:enesstore/models/eicons_icons.dart';
import '../services/cart_manager.dart';


// Ürün Kartı Widget'ı
class ProductCard extends StatelessWidget {
  // Kartta gösterilecek ürün ve ikon rengi
  final Product product;
  final Color addCartIconColor;

  // Yapıcı (constructor) fonksiyon
  const ProductCard({
    super.key,
    required this.product,
    required this.addCartIconColor,
  });

  // Kart arayüzünün oluşturulması
  @override
  Widget build(BuildContext context) {
    return Container(
      // Kartın dış boşluk ve iç boşluk ayarları
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      // Kart içeriği: Ürün görseli ve bilgiler
      child: Row(
        children: [
          // Ürün görseli
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              product.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 16),
          // Ürün başlığı, fiyatı ve sepete ekle butonu
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ürün başlığı
                Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Fiyat ve sepete ekle butonu
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${product.price} \$",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Eicons.add_shopping_cart,
                        size: 30,
                        color: addCartIconColor,
                      ),
                      onPressed: () {
                        CartManager.addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${product.title} sepete eklendi'),
                          duration: const Duration(milliseconds: 300),
                        ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}