import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,

    required this.text,
    required this.press,

  });

  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: kPrimaryColor
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Text(
              "See More",
              style: TextStyle(
                color: kSecondaryColor
              )
            ),
          )
        ],
      ),
    );
  }
}