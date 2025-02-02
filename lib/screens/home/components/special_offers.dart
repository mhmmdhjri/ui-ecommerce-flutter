import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/home/components/section_title.dart';
import 'package:ui_ecommerce/size_config.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: 'Special for you',
          press: () {},
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                category: 'Smartphone',
                image: 'assets/images/banner.png',
                numOfBrands: 18,
                press: () {},
              ),
    
              SpecialOfferCard(
                category: 'Fashion',
                image: 'assets/images/Image Banner 3.png',
                numOfBrands: 24,
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,

    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  });

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(20)
      ),
      child: SizedBox(
        width: getProportionateScreenWidth(262),
        height: getProportionateScreenWidth(100),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF343434).withOpacity(0.1),
                      Color(0xFF343434).withOpacity(0.3),
                    ]
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15),
                  vertical: getProportionateScreenWidth(10)
                ),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(text: "$category\n",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.bold
                        )
                      ),
                      TextSpan(text: "$numOfBrands Brands")
                    ]
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}