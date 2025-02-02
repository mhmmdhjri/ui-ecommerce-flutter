import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/product_card.dart';
import 'package:ui_ecommerce/models/Product.dart';
import 'package:ui_ecommerce/screens/details_screen/details_screen.dart';
import 'package:ui_ecommerce/screens/home/components/section_title.dart';
import 'package:ui_ecommerce/size_config.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Popular Products",
          press: () {}
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) => ProductCard(
                  product: demoProducts[index],
                  press: () {
                    Navigator.pushNamed(context,DetailsScreen.routeName,arguments: ProductDetailsArgument(product: demoProducts[index],),);
                  }
                  ),
                ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}