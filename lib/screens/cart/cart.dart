import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_daylee/utils/colors.dart';
import 'package:flutter_daylee/widgets/content_text1.dart';
import 'package:flutter_daylee/widgets/content_text2.dart';
import 'package:flutter_daylee/widgets/title_widget.dart';
import 'package:flutter_daylee/widgets/emoji_icon.dart';
import 'package:flutter_daylee/screens/success_splash/success_splash.dart';

import 'package:flutter_daylee/model.dart';


class CartScreen extends StatefulWidget {
  final Store store;

  const CartScreen({Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late String _location;
  late String _deliveryMethod;

  @override
  void initState() {
    super.initState();
    _location = "Kos Cisitu Baru No.99";
    _deliveryMethod = "Gosend Same Day";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        leading: IconButton(
          icon: const Icon(IconData(0xe094, fontFamily: 'MaterialIcons'),
            color: AppColors.mainColor2,
            size: 18,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0.0,
        title: TitleText(text: "Pesanan Anda",),
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(175),
          child: Container(
            margin: const EdgeInsets.only(right: 18, left: 18, top: 2, bottom: 6),
            padding: const EdgeInsets.only(bottom: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.cardBackgroundColor,
                  ),
                  child: Row(
                    children: [
                      EmojiIcon(emoji: "🏁", size: 22,),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContentText1(text: "Estimasi Selesai", size: 13,),
                          TitleText(text: "Estimasi waktu selesai 15 menit", size: 14,),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  child: Row(
                    children: [
                      EmojiIcon(emoji: "📍", size: 22,),
                      SizedBox(width: 8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContentText1(text: "Lokasi Pengiriman", size: 13,),
                          TitleText(text: _location, size: 14,),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        height: 25,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.buttonBackgroundColor,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4,),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {},
                          child: ContentText2(text: 'Ganti Lokasi', size: 12, color: AppColors.mainColor2,),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  child: Row(
                    children: [
                      EmojiIcon(emoji: "📦", size: 22,),
                      SizedBox(width: 8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContentText1(text: "Metode Pengiriman", size: 13,),
                          TitleText(text: _deliveryMethod, size: 14,),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        height: 25,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.buttonBackgroundColor,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4,),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {},
                          child: ContentText2(text: 'Ganti Metode', size: 12, color: AppColors.mainColor2,),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 4,),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CartSection(type: widget.store.type,),
              PaymentSection(),
            ]
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: const BoxDecoration(
          color: AppColors.mainColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.unsignColor,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(0.0, 0.0),
            )
          ]
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.mainColor2,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            context.read<Transcation>().addTransaction(
              TransactionItem(
                cart: List<CartItem>.from(context.read<Cart>().cart),
                storeName: widget.store.name,
                isValid: true,
                type: widget.store.type,
                status: "Diproses",
                statusDescription: "Sedang diproses toko",
                transactionTime: DateTime.now(),
              )
            );
            context.read<Cart>().removeAll();
            Navigator.pushAndRemoveUntil(context, _createRoute(), (route) => false);
          },
          child: const Text(
            "Pesan Sekarang",
            style: TextStyle(
              fontFamily: "Lato",
              color: AppColors.mainColor,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SuccessSplashScreen(),
      // transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class CartSection extends StatefulWidget {
  final String type;
  const CartSection({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        color: AppColors.mainColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(top: 6, bottom: 10),
                child: TitleText(text: "Pesanan", size: 16,)
            ),
            Wrap(
              direction: Axis.vertical,
              spacing: 14,
              children: Provider.of<Cart>(context).cart.map((item){
                return ProductCartCard(cartItem: item, type: widget.type);
              }).toList(),
            ),
          ],
        )
    );
  }
}

class PaymentSection extends StatefulWidget {
  const PaymentSection({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  late int _deliveryFee;
  late String _voucher;
  late int _platformFee;
  late int _discountedDeliveryFee;
  late int _discountedPlatformFee;

  @override
  void initState() {
    super.initState();
    _voucher = "Diskon Gratis Ongkir";
    _deliveryFee = 10000;
    _platformFee = 2000;
    _discountedDeliveryFee = _deliveryFee;
    _discountedPlatformFee = _platformFee;
  }

  @override
  Widget build(BuildContext context) {
    setDiscount();
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0,);
    final formatNumber = NumberFormat.decimalPattern('id_ID');
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 4, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      color: AppColors.mainColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(top: 6, bottom: 10),
              child: TitleText(text: "Total Pembayaran", size: 16,)
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mainColor2,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/navbar_sale.svg",
                    color: AppColors.iconColor1,
                    width: 22,
                  ),
                ),
                SizedBox(width: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContentText1(text: "Voucher", size: 13,),
                    TitleText(text: _voucher, size: 14,),
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 25,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.buttonBackgroundColor,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4,),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: ContentText2(text: 'Ganti Voucher', size: 12, color: AppColors.mainColor2,),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 324,
            child: DottedLine(
              dashColor: AppColors.unsignColor,
            ),
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              ContentText1(text: "Harga Pesanan", size: 16,),
              Spacer(),
              ContentText1(text: "Rp""${formatNumber.format(Provider.of<Cart>(context).total)}", size: 16,),
            ],
          ),
          SizedBox(height: 4,),
          Row(
            children: [
              ContentText1(text: "Biaya Pengantaran", size: 16,),
              Spacer(),
              ContentText1(text: "Rp", size: 16,),
              if (_deliveryFee!=_discountedDeliveryFee) ContentText1(text: "${formatNumber.format(_deliveryFee)}", size: 16, decoration: TextDecoration.lineThrough,),
              ContentText1(text: " ${formatNumber.format(_discountedDeliveryFee)}", size: 16,),
            ],
          ),
          SizedBox(height: 4,),
          Row(
            children: [
              ContentText1(text: "Biaya Platform", size: 16,),
              Spacer(),
              ContentText1(text: "Rp", size: 16,),
              if (_platformFee!=_discountedPlatformFee) ContentText1(text: "${formatNumber.format(_platformFee)}", size: 16, decoration: TextDecoration.lineThrough,),
              ContentText1(text: " ${formatNumber.format(_discountedPlatformFee)}", size: 16,),
            ],
          ),
          SizedBox(height: 8,),
          const SizedBox(
            width: 324,
            child: DottedLine(
              dashColor: AppColors.unsignColor,
            ),
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              TitleText(text: "Total", size: 16,),
              Spacer(),
              TitleText(text: "${formatCurrency.format(Provider.of<Cart>(context).total + _discountedDeliveryFee + _discountedPlatformFee)}", size: 16,),
            ],
          ),
        ],
      )
    );
  }

  void setDiscount() {
    setState(() {
      if (_voucher=="Diskon Gratis Ongkir") {
        _discountedDeliveryFee = 0;
      } else if (_voucher=="Diskon Biaya Platform") {
        _discountedPlatformFee = 0;
      }
    });
  }
}

class ProductCartCard extends StatefulWidget {
  final String type;
  final CartItem cartItem;
  const ProductCartCard({
    Key? key,
    required this.type,
    required this.cartItem,
  }) : super(key: key);

  @override
  State<ProductCartCard> createState() => _ProductCartCardState();
}

class _ProductCartCardState extends State<ProductCartCard> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.cartItem.quantity;
  }

  void increment() {
    setState(() {
      _quantity++;
    });
  }

  void decrement() {
    setState(() {
      (_quantity==0) ? _quantity=0 : _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    String image;
    if (widget.type=="Galon") {
      image = "assets/images/galon_product1.png";
    } else {
      image = "assets/images/laundry_product1.png";
    }
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(text: widget.cartItem.product.name, size: 14,),
                  SizedBox(height: 2,),
                  ContentText2(text: widget.cartItem.product.description, size: 12, color: AppColors.descTextColor,),
                  SizedBox(height: 7,),
                  Text(
                    formatCurrency.format(widget.cartItem.product.price),
                    style: const TextStyle(
                      fontFamily: "Lato",
                      color: AppColors.titleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  increment();
                  context.read<Cart>().increaseQuantity(CartItem(product: widget.cartItem.product, quantity: _quantity));
                },
                padding: const EdgeInsets.only(right: 8),
                constraints: const BoxConstraints(),
                icon: const Icon(IconData(0xe74d, fontFamily: 'MaterialIcons')),
                color: AppColors.mainColor2,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  "${Provider.of<Cart>(context).getQuantity(widget.cartItem.product)}",
                  style: const TextStyle(
                    fontFamily: "Lato",
                    color: AppColors.titleColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  decrement();
                  context.read<Cart>().decreaseQuantity(CartItem(product: widget.cartItem.product, quantity: _quantity));
                  if (Provider.of<Cart>(context, listen: false).cart.isEmpty) {
                    Navigator.of(context).pop();
                  }
                },
                padding: const EdgeInsets.only(left: 8, right: 18),
                constraints: const BoxConstraints(),
                icon: const Icon(IconData(0xec0c, fontFamily: 'MaterialIcons')),
                color: AppColors.disableColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}