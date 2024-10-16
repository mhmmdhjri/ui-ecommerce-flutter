
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    super.key,
    required this.svgSrc,
    this.numOfItems = 0,
    required this.press,
  });

  final String svgSrc;
  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenHeight(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 109, 109, 109).withOpacity(0.1),
              shape: BoxShape.circle
            ),
            child: SvgPicture.asset(svgSrc,
              color: const Color.fromARGB(255, 89, 89, 89)
            ),
          ),
          if (numOfItems != 0)
          Positioned(
            right: 0,
            top: -1,
            child: Container(
              height: getProportionateScreenHeight(16),
              width: getProportionateScreenWidth(16),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 44, 177, 225),
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: Colors.white
                )
              ),
              child: Center(
                child: Text(
                  "$numOfItems",
                  style: TextStyle(fontSize: 10,
                  color: Colors.white, 
                  fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('numOfItems', numOfItems));
  }
}
