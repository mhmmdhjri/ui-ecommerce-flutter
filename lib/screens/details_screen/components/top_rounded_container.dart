import 'package:flutter/material.dart';
import 'package:ui_ecommerce/size_config.dart';

class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    super.key,
    required this.color,
    required this.child,
  });

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )
      ),
      child: child,
    );
  }
}