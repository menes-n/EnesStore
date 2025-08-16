import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

// API'dan ürünleri çeken fonksiyon
Future<List<Product>> fetchProducts() async {
  // HTTP GET isteği gönderiliyor
  final response = await http.get(
    Uri.parse('https://fakestoreapi.com/products'),
  );

  // Başarılı cevap alınırsa JSON verisi işleniyor
  if (response.statusCode == 200) {
    List jsonData = json.decode(response.body);
    return jsonData.map((item) => Product.fromJson(item)).toList();
  } else {
    // Hata durumunda exception fırlatılıyor
    throw Exception('Ürünler alınamadı');
  }
}