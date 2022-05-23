import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:dotted_line/dotted_line.dart';

import 'package:flutter_daylee/utils/colors.dart';
import 'package:flutter_daylee/widgets/content_text1.dart';
import 'package:flutter_daylee/widgets/content_text2.dart';
import 'package:flutter_daylee/widgets/title_widget.dart';

import 'package:flutter_daylee/model.dart';
import 'package:flutter_daylee/screens/cart/cart.dart';


class StoresScreen extends StatefulWidget {
  // final String store, image;
  // final double rating, distance;
  // final int priceRatio;
  final Store store;

  const StoresScreen({Key? key,
    required this.store,
    // required this.store,
    // required this.rating,
    // required this.distance,
    // required this.priceRatio,
    // this.image = "assets/images/galon_store1.png"
  }) : super(key: key);

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  late List<String> _productType;

  @override
  void initState() {
    super.initState();
    _productType = (widget.store.products.map((e) => e.type)).toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    String image;
    if (widget.store.type=="Galon") {
      image = "assets/images/galon_store1.png";
    } else {
      image = "assets/images/laundry_store1.png";
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        leading: IconButton(
          icon: const Icon(IconData(0xe094, fontFamily: 'MaterialIcons'),
            color: AppColors.mainColor2,
            size: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            context.read<Cart>().removeAll();
          }
        ),
        titleSpacing: 0.0,
        title: TitleText(text: widget.store.name,),
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: Container(
            margin: const EdgeInsets.only(right: 18, left: 18, top: 2, bottom: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(text: widget.store.name, size: 16,),
                        ContentText1(text: "Galon", size: 14,)
                      ],
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.cardBackgroundColor,
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TitleText(text: "⭐ ${widget.store.rating}", size: 14,),
                            ContentText2(text: "Rating", size: 13,),
                          ],
                        ),
                        const VerticalDivider(
                          color: AppColors.lineDividerColor,
                          thickness: 1.5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TitleText(text: "📍 ${widget.store.distance} KM", size: 14,),
                            ContentText2(text: "Jarak", size: 13,),
                          ],
                        ),
                        const VerticalDivider(
                          color: AppColors.lineDividerColor,
                          thickness: 1.5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                TitleText(text: "💰 "+"\$"*widget.store.priceRatio, size: 14,),
                                TitleText(text: "\$"*(5-widget.store.priceRatio), size: 14, color: AppColors.unsignColor,),
                              ],
                            ),
                            ContentText2(text: "Harga", size: 13,),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 8,),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(bottom: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _productType.map((type) {
              return StoreProductListSection(
                title: type,
                type: widget.store.type,
                filteredProductList: widget.store.products.where((element) => element.type==type).toList(),
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: _showCartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _showCartButton() {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
    if (Provider.of<Cart>(context).cart.isEmpty) {
      return Container();
    } else {
      return FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        backgroundColor: AppColors.mainColor2,
        label: Row(
          children: [
            Text(
              "${Provider.of<Cart>(context).cart.length} Pesanan",
              style: const TextStyle(
                fontFamily: "Lato",
                color: AppColors.mainColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 88,),
            Text(
              formatCurrency.format(Provider.of<Cart>(context).total),
              style: const TextStyle(
                fontFamily: "Lato",
                color: AppColors.mainColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        icon: Icon(IconData(0xf0170, fontFamily: 'MaterialIcons'), color: AppColors.mainColor, size: 30,),
        elevation: 5,
      );
    }
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => CartScreen(store: widget.store,),
      // transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
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

class StoreProductListSection extends StatelessWidget {
  final String title;
  final String type;
  final Function? press;
  final List<Product> filteredProductList;
  const StoreProductListSection({
    Key? key,
    required this.title,
    required this.type,
    required this.filteredProductList,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        color: AppColors.mainColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: TitleText(text: title, size: 16,)
            ),
            Wrap(
              direction: Axis.vertical,
              spacing: 14,
              children: filteredProductList.map((item){
                return ProductCard(product: item, type: type);
              }).toList(),
            ),
          ],
        )
    );
  }
}

class ProductCard extends StatefulWidget {
  final String type;
  final Product product;
  const ProductCard({
    Key? key,
    required this.product,
    required this.type,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int quantity = 0;

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      (quantity==0) ? quantity=0 : quantity--;
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
                  TitleText(text: widget.product.name, size: 14,),
                  SizedBox(height: 2,),
                  ContentText2(text: widget.product.description, size: 12, color: AppColors.descTextColor,),
                  SizedBox(height: 7,),
                  Text(
                    formatCurrency.format(widget.product.price),
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
                  context.read<Cart>().increaseQuantity(CartItem(product: widget.product, quantity: quantity));
                },
                padding: const EdgeInsets.only(right: 8),
                constraints: const BoxConstraints(),
                icon: const Icon(IconData(0xe74d, fontFamily: 'MaterialIcons')),
                color: AppColors.mainColor2,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  "${Provider.of<Cart>(context).getQuantity(widget.product)}",
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
                  context.read<Cart>().decreaseQuantity(CartItem(product: widget.product, quantity: quantity));
                },
                padding: const EdgeInsets.only(left: 8, right: 18),
                constraints: const BoxConstraints(),
                icon: const Icon(IconData(0xec0c, fontFamily: 'MaterialIcons')),
                color: AppColors.disableColor,
              ),
            ],
          ),
          const SizedBox(height: 6,),
          const SizedBox(
            width: 324,
            child: DottedLine(
              dashColor: AppColors.unsignColor,
            ),
          ),
        ],
      ),
    );
  }
}


