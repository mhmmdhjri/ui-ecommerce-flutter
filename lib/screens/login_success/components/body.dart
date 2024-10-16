import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/screens/home/home_screen.dart';
import 'package:ui_ecommerce/size_config.dart';

class Body extends StatelessWidget {
  const Body({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset("assets/images/yeay.png",
          height: SizeConfig.screenHeight * 0.5
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.1),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.8,
          child: MyDefaultButton(
            text: "Continue",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            }
            ),
        ),
        Spacer(),
      ],
    );
  }
}