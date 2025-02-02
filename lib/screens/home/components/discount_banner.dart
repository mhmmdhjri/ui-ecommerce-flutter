import 'package:flutter/material.dart';
import 'package:ui_ecommerce/size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20)
        ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15)
    
        ),
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 88, 146, 30),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text.rich(
        TextSpan(text: "A Summer Surpise\n",
          style: TextStyle(
            color: Colors.white
          ),
          children: [
            TextSpan(
              text: "100% OFF",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold
              )
            )
          ]
        )
      ),
    );
  }
}