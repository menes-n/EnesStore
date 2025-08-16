// Ürün Modeli Sınıfı
class Product {
  // Ürün özellikleri (alanlar)
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  int count;


  // Yapıcı (constructor) fonksiyon
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    this.count = 1,

  });

  // JSON'dan Product nesnesi oluşturma (factory constructor)
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
    );
  }
}
