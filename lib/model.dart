import 'package:flutter/material.dart';

class Store {
  String name;
  String type;
  double rating;
  double distance;
  int priceRatio;
  List<Product> products;

  Store({
    required this.name,
    required this.type,
    required this.rating,
    required this.distance,
    required this.priceRatio,
    required this.products,
  });
}

class Stores {
  List<Store> stores = [];

  Stores() {
    _initialize();
  }

  void _initialize() {
    for (var store in storeList) {
      stores.add(store);
    }
  }
}

class Product {
  Product({
    required this.name,
    required this.type,
    required this.price,
    required this.description,
  });

  final String name;
  final String type;
  final int price;
  final String description;
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  List<CartItem> cart = [];

  int get total {
    return cart.fold(0, (int currentTotal, CartItem nextCartItem) {
      return currentTotal + nextCartItem.product.price*nextCartItem.quantity;
    });
  }

  int getQuantity(Product product) {
    if (cart.isEmpty) {
      return 0;
    }
    for (var element in cart) {
      if (element.product.name==product.name) {
        return element.quantity;
      }
    }
    return 0;
  }

  void increaseQuantity(CartItem cartItem) {
    for (var element in cart) {
      if (element.product.name==cartItem.product.name) {
        element.quantity++;
        notifyListeners();
        return ;
      }
    }
    cart.add(cartItem);
    notifyListeners();
    return ;
  }

  void decreaseQuantity(CartItem chartItem) {
    for (var element in cart) {
      if (element.product.name==chartItem.product.name) {
        if (element.quantity==1) {
          cart.remove(element);
        } else {
          element.quantity--;
        }
        notifyListeners();
      }
    }
  }

  void removeAll() => cart.clear();
}

class TransactionItem {
  List<CartItem> cart;
  String storeName;
  bool isValid;
  String type;
  String status;
  String statusDescription;
  DateTime transactionTime;

  TransactionItem({
    required this.cart,
    required this.storeName,
    required this.isValid,
    required this.type,
    required this.status,
    required this.statusDescription,
    required this.transactionTime,
  });
}

class Transcation with ChangeNotifier {
  List<TransactionItem> transactions = [];

  Transcation() {
    _initialize();
  }

  void _initialize() {
    for (var transactionItem in transactionList) {
      transactions.add(transactionItem);
    }
  }

  void addTransaction(TransactionItem transactionItem) {
    transactions.insert(0, transactionItem);
  }
}

final List<Product> productList = <Product>[
  Product(
      name: "Isi Ulang Aqua Galon",
      type: "Isi Ulang",
      price: 20000,
      description: "Galon dipickup saat pengantaran"
  ),
  Product(
      name: "Isi Ulang Biasa",
      type: "Isi Ulang",
      price: 5000,
      description: "Galon dipickup saat pengantaran"
  ),
  Product(
      name: "Isi Ulang LeMinerale Galon",
      type: "Isi Ulang",
      price: 20000,
      description: "Galon dipickup saat pengantaran"
  ),
  Product(
      name: "Aqua Galon",
      type: "Isi Ulang + Galon",
      price: 50000,
      description: "Termasuk Galon"
  ),
  Product(
      name: "LeMinerale Galon",
      type: "Isi Ulang + Galon",
      price: 50000,
      description: "Termasuk Galon"
  ),
  Product(
      name: "Vit Galon",
      type: "Isi Ulang + Galon",
      price: 50000,
      description: "Termasuk Galon"
  ),
];

List<Store> storeList = <Store>[
  Store(
    name: "Galon Bang Lorem",
    type: "Galon",
    rating: 4.8,
    distance: 0.2,
    priceRatio: 3,
    products: <Product>[
      Product(
          name: "Isi Ulang Aqua Galon",
          type: "Isi Ulang",
          price: 20000,
          description: "Galon dipickup saat pengantaran"
      ),
      Product(
          name: "Isi Ulang Biasa",
          type: "Isi Ulang",
          price: 5000,
          description: "Galon dipickup saat pengantaran"
      ),
      Product(
          name: "Isi Ulang LeMinerale Galon",
          type: "Isi Ulang",
          price: 20000,
          description: "Galon dipickup saat pengantaran"
      ),
      Product(
          name: "Aqua Galon",
          type: "Isi Ulang + Galon",
          price: 50000,
          description: "Termasuk Galon"
      ),
      Product(
          name: "LeMinerale Galon",
          type: "Isi Ulang + Galon",
          price: 50000,
          description: "Termasuk Galon"
      ),
      Product(
          name: "Vit Galon",
          type: "Isi Ulang + Galon",
          price: 50000,
          description: "Termasuk Galon"
      ),
    ],
  ),
  Store(
    name: "Mamang Galon Antar",
    type: "Galon",
    rating: 4.9,
    distance: 0.5,
    priceRatio: 3,
    products: <Product>[
      Product(
          name: "Aqua Galon",
          type: "Isi Ulang",
          price: 20000,
          description: "Galon anter"
      ),
      Product(
          name: "Air Isi Ulang Berkah",
          type: "Isi Ulang",
          price: 5000,
          description: "Galon siapin pas dianter"
      ),
      Product(
          name: "Galon Amidis",
          type: "Isi Ulang",
          price: 19500,
          description: "Galon diambil pas dianter"
      ),
    ],
  ),
  Store(
    name: "Galon 24/7",
    type: "Galon",
    rating: 4.9,
    distance: 0.6,
    priceRatio: 2,
    products: <Product>[
      Product(
          name: "Aqua Galon",
          type: "Isi Ulang",
          price: 20000,
          description: "19 L"
      ),
      Product(
          name: "Air Mineral",
          type: "Isi Ulang",
          price: 5000,
          description: "19 L"
      ),
      Product(
          name: "LeMinerale Mini",
          type: "Galon Satuan",
          price: 15000,
          description: "15 L"
      ),
    ],
  ),
  Store(
    name: "Laundry Yellow",
    type: "Laundry",
    rating: 4.5,
    distance: 0.1,
    priceRatio: 1,
    products: <Product>[
      Product(
          name: "Kaos/Kemeja",
          type: "Laundry per pcs",
          price: 1000,
          description: "BEBAS"
      ),
      Product(
          name: "Sweater/Polo",
          type: "Laundry per pcs",
          price: 1500,
          description: "BEBAS"
      ),
      Product(
          name: "Celana Boxer/Celana Bahan",
          type: "Laundry per pcs",
          price: 1000,
          description: "BUKAN JEANS"
      ),
      Product(
          name: "Celana Jeans",
          type: "Laundry per pcs",
          price: 2500,
          description: "JEANS"
      ),
      Product(
          name: "Jaket Tebal",
          type: "Laundry per pcs",
          price: 2500,
          description: "KHUSUS JAKET"
      ),
    ],
  ),
  Store(
    name: "Laundry Simpang",
    type: "Laundry",
    rating: 4.9,
    distance: 0.4,
    priceRatio: 2,
    products: <Product>[
      Product(
          name: "Kaos/Kemeja Bewarna",
          type: "Laundry per pcs",
          price: 900,
          description: "KHUSUS BEWARNA"
      ),
      Product(
          name: "Kaos/Kemeja Putih",
          type: "Laundry per pcs",
          price: 1200,
          description: "KHUSUS PUTIH"
      ),
      Product(
          name: "Celana Boxer/Celana Bahan",
          type: "Laundry per pcs",
          price: 900,
          description: "BUKAN JEANS"
      ),
      Product(
          name: "Celana Jeans",
          type: "Laundry per pcs",
          price: 2400,
          description: "JEANS"
      ),
      Product(
          name: "Jaket Tebal",
          type: "Laundry per pcs",
          price: 2400,
          description: "KHUSUS JAKET"
      ),
    ],
  ),
  Store(
    name: "Laundry Simpang",
    type: "Laundry",
    rating: 4.9,
    distance: 0.4,
    priceRatio: 2,
    products: <Product>[
      Product(
          name: "Kaos/Kemeja Bewarna",
          type: "Laundry per pcs",
          price: 900,
          description: "KHUSUS BEWARNA"
      ),
      Product(
          name: "Kaos/Kemeja Putih",
          type: "Laundry per pcs",
          price: 1200,
          description: "KHUSUS PUTIH"
      ),
      Product(
          name: "Celana Boxer/Celana Bahan",
          type: "Laundry per pcs",
          price: 900,
          description: "BUKAN JEANS"
      ),
      Product(
          name: "Celana Jeans",
          type: "Laundry per pcs",
          price: 2400,
          description: "JEANS"
      ),
      Product(
          name: "Jaket Tebal",
          type: "Laundry per pcs",
          price: 2400,
          description: "KHUSUS JAKET"
      ),
    ],
  ),
];

List<TransactionItem> transactionList = <TransactionItem>[
  TransactionItem(
    storeName: "Laundry Yellow",
    type: "Laundry",
    isValid: true,
    cart: <CartItem>[
      CartItem(
          product: Product(
              name: "Kaos/Kemeja/Sweater/Polo/Daster",
              type: "Laundry per pcs",
              price: 1000,
              description: "BERWARNA"
          ),
          quantity: 4
      ),
    ],
    status: "Diproses",
    statusDescription: "Perkiraan waktu antar 28/05 19:00",
    transactionTime: DateTime(2022, 5, 24, 17, 30),
  ),
  TransactionItem(
    storeName: "Galon Bang Lorem",
    type: "Galon",
    isValid: false,
    cart: <CartItem>[
      CartItem(
        product: Product(
          name: "Isi Ulang Aqua Galon",
          type: "Isi Ulang",
          price: 20000,
          description: "Galon dipickup saat pengantaran"
        ),
        quantity: 1
      ),
    ],
    status: "Dibatalkan Penjual",
    statusDescription: "Toko Tutup",
    transactionTime: DateTime(2022, 5, 23, 17, 30),
  ),
  TransactionItem(
    storeName: "Galon Bang Lorem",
    type: "Galon",
    isValid: false,
    cart: <CartItem>[
      CartItem(
          product: Product(
              name: "Isi Ulang Aqua Galon",
              type: "Isi Ulang",
              price: 20000,
              description: "Galon dipickup saat pengantaran"
          ),
          quantity: 1
      ),
    ],
    status: "Dibatalkan Penjual",
    statusDescription: "Toko Tutup",
    transactionTime: DateTime(2022, 5, 23, 17, 00),
  ),
  TransactionItem(
    storeName: "Galon Bang Lorem",
    type: "Galon",
    isValid: false,
    cart: <CartItem>[
      CartItem(
          product: Product(
              name: "Isi Ulang Aqua Galon",
              type: "Isi Ulang",
              price: 20000,
              description: "Galon dipickup saat pengantaran"
          ),
          quantity: 1
      ),
    ],
    status: "Dibatalkan Penjual",
    statusDescription: "Toko Tutup",
    transactionTime: DateTime(2022, 5, 23, 16, 30),
  ),
  TransactionItem(
    storeName: "Galon Bang Lorem",
    type: "Galon",
    isValid: false,
    cart: <CartItem>[
      CartItem(
          product: Product(
              name: "Isi Ulang Aqua Galon",
              type: "Isi Ulang",
              price: 20000,
              description: "Galon dipickup saat pengantaran"
          ),
          quantity: 1
      ),
    ],
    status: "Dibatalkan Penjual",
    statusDescription: "Toko Tutup",
    transactionTime: DateTime(2022, 5, 23, 15, 48),
  ),
];