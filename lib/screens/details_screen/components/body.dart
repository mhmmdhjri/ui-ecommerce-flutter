import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/components/rounded_icon_btn.dart';
import 'package:ui_ecommerce/models/Product.dart';
import 'package:ui_ecommerce/screens/details_screen/components/color_dots.dart';
import 'package:ui_ecommerce/screens/details_screen/components/product_description.dart';
import 'package:ui_ecommerce/screens/details_screen/components/product_images.dart';
import 'package:ui_ecommerce/screens/details_screen/components/top_rounded_container.dart';
import 'package:ui_ecommerce/size_config.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: widget.product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: widget.product,
                  pressOnSeeMore: () {}, 
                ),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      ColorDots(product: widget.product),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            top: getProportionateScreenWidth(15),
                            bottom: getProportionateScreenWidth(40),
                          ),
                          child: MyDefaultButton(
                            text: "Add to Cart",
                            press: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ColorDots extends StatefulWidget {
  const ColorDots({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  _ColorDotsState createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  int selectedColor = 0; // Inisialisasi warna yang dipilih
  int quantity = 1; // Jumlah produk yang dipilih, dimulai dari 1

  // Metode untuk menambah jumlah produk
  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  // Metode untuk mengurangi jumlah produk
  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        children: [
          // Loop untuk menampilkan warna produk yang tersedia
          ...List.generate(
            widget.product.colors.length,
            (index) => ColorDot(
              color: widget.product.colors[index],
              isSelected: selectedColor == index, // Periksa apakah dot dipilih
              onTap: () {
                setState(() {
                  selectedColor = index; // Update warna yang dipilih
                });
              },
            ),
          ),
          Spacer(),
          
          // Tombol untuk mengurangi jumlah produk
          RoundedIconBtn(
            iconData: Icons.remove,
            press: decrementQuantity, // Panggil metode decrement
          ),
          SizedBox(width: getProportionateScreenWidth(15)),
          
          // Menampilkan jumlah produk
          Text(
            "$quantity",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(15)),
          
          // Tombol untuk menambah jumlah produk
          RoundedIconBtn(
            iconData: Icons.add,
            press: incrementQuantity, // Panggil metode increment
          ),
        ],
      ),
    );
  }
}

