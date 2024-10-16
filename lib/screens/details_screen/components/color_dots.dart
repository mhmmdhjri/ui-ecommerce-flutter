import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';

class ColorDot extends StatelessWidget {
  const ColorDot({
    super.key,
    required this.color,
    required this.onTap,
    this.isSelected = false,
  });

  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: onTap, // Panggil onTap ketika di klik
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200), // Animasi transisi ukuran
          margin: EdgeInsets.only(right: 2),
          padding: EdgeInsets.all(8),
          height: isSelected ? getProportionateScreenWidth(48) : getProportionateScreenWidth(40), // Ukuran berbeda saat dipilih
          width: isSelected ? getProportionateScreenWidth(48) : getProportionateScreenWidth(40),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? kPrimaryColor : Colors.transparent,
            ),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
