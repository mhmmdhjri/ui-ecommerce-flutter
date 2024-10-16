import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/screens/home/home_screen.dart';
import 'package:ui_ecommerce/screens/profile/profile_screen.dart';


class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({
    super.key,
    required this.selectedMenu,
  });

  final MenuState selectedMenu;

  @override
  _CustomBottomNavbarState createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi MotionTabBarController
    _motionTabBarController = MotionTabBarController(
      initialIndex: widget.selectedMenu.index, // Mengatur tab yang dipilih pertama kali
      length: 4, // Jumlah tab
      vsync: this,
    );
  }

  @override
  void dispose() {
    _motionTabBarController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = const Color.fromARGB(255, 68, 68, 68);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: MotionTabBar(
          controller: _motionTabBarController, // Menambahkan controller untuk kontrol tab
          initialSelectedTab: "Home", // Set tab yang dipilih pertama kali
          labels: const ["Home", "Favourite", "Message", "Profile"], // Label tab
          icons: const [
            Icons.home,
            Icons.favorite,
            Icons.chat,
            Icons.person,
          ], // Ikon tab
          tabSize: 50,
          tabBarHeight: 60,
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: Colors.blue[600],
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
          tabSelectedColor: Colors.blue[900],
          tabIconSelectedColor: Colors.white,
          tabBarColor: Colors.white,
          badges: [
            const MotionBadgeWidget(
              text: '10+', // Badge untuk tab Favorite
              textColor: Colors.white,
              color: Colors.red,
              size: 18,
            ),
            const MotionBadgeWidget(
              isIndicator: true, // Indicator untuk tab Message
              color: Colors.blue,
              size: 5,
              show: true,
            ),
            null, // Tidak ada badge untuk tab Message
            null, // Tidak ada badge untuk tab Profile
          ],
          onTabItemSelected: (int index) {
            setState(() {
              // Update selected tab index pada perubahan tab
              _motionTabBarController!.index = index;
            });

            // Navigasi berdasarkan tab yang dipilih
            switch (index) {
              case 0:
                Navigator.pushNamed(context, HomeScreen.routeName);
                break;
              case 1:
                Navigator.pushNamed(context, '/favourite');
                break;
              case 2:
                Navigator.pushNamed(context, '/message');
                break;
              case 3:
                Navigator.pushNamed(context, ProfileScreen.routeName);
                break;
            }
          },
        ),
      ),
    );
  }
}
