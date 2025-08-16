import '../models/product.dart';



class CartManager {
  static final List<Product> _cartItems = [];

  static List<Product> getCartItems() => _cartItems;

  static void addToCart(Product product) {
  final index = _cartItems.indexWhere((item) => item.id == product.id);
  if (index != -1) {
    _cartItems[index].count += 1; // Her tıklamada sadece 1 artır
  } else {
    final newProduct = Product(
      id: product.id,
      title: product.title,
      description: product.description,
      price: product.price,
      image: product.image,
      count: 1, // Yeni ekleniyorsa count = 1
    );
    _cartItems.add(newProduct);
  }
}


  static void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item.id == product.id);
  }

  static void updateItemCount(Product product, int count) {
    final index = _cartItems.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      _cartItems[index].count = count;
    }
  }
}