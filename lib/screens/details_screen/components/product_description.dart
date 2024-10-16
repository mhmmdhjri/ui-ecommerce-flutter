import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/models/Product.dart';
import 'package:ui_ecommerce/size_config.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    super.key,
    required this.product,
    required this.pressOnSeeMore,
  });

  final Product product;
  final GestureTapCallback pressOnSeeMore;

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool isExpanded = false; // Menandakan apakah deskripsi lebih banyak atau tidak

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Text(
            widget.product.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color: widget.product.isFavourite
                  ? Color(0xFFFFE6E6)
                  : Color(0xFFF5F6F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color: widget.product.isFavourite
                  ? Color(0xFFFF4848)
                  : Color(0xFFDBDEE4),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            isExpanded
                ? widget.product.description
                : widget.product.description.substring(0, 50) + "...", // Menampilkan potongan deskripsi jika belum di-expand
            maxLines: isExpanded ? null : 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(10),
          ),
          child: GestureDetector(
            onTap: widget.pressOnSeeMore, // Panggil fungsi untuk toggle
            child: Row(
              children: [
                Text(
                  isExpanded ? "See Less" : "See More", // Ganti teks sesuai dengan status expand
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
