




import 'package:flutter/material.dart';
import 'package:ui_ecommerce/size_config.dart';

const kPrimaryColor = Color.fromARGB(255, 64, 185, 255); // Bright Pink - cerah dan mencolok
const kPrimaryLightColor = Color.fromARGB(255, 174, 212, 250); // Light Pink - lembut dan menyegarkan
// this is list for Gradient
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 109, 118, 242), // Light Pink - cerah dan energik
    Color.fromARGB(255, 64, 207, 255), // Bright Pink - utama dan menarik
  ],
);
const kSecondaryColor = Color.fromARGB(255, 200, 188, 26); // Fresh Green - aksen cerah yang segar
const kTextColor = Color(0xff212121); // Charcoal Gray - kontras yang nyaman untuk teks
const kBackgroundColor = Color(0xffF5F5F5); // Light Gray - latar belakang bersih dan modern






// animation duration
const kAnimationDuration = Duration(milliseconds: 200);


final headingStyle = TextStyle(
            fontSize: getProportionateScreenWidth(28),
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.5
          );


// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAdressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
                enabledBorder: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
                border: outlineInputBorder()
              );

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: kPrimaryColor),
              );
}