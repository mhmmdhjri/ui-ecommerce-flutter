import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/constant.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
    this.iconColor = const Color.fromARGB(255, 64, 105, 255), // Default ke warna pink cerah
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;
  final Color iconColor; // Tambahkan parameter warna untuk ikon

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 64, 121, 255), // Warna teks default
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor:  const Color.fromARGB(255, 111, 111, 111).withOpacity(0.1), // Background tombol
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: iconColor, // Warna ikon akan berasal dari parameter
              width: 22,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(text),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color.fromARGB(255, 79, 121, 237), // Warna ikon panah
            ),
          ],
        ),
      ),
    );
  }
}
