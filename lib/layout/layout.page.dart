import 'package:flutter/material.dart';
import 'package:herag/core/constants/constants.dart';

import '../features/account/pages/account_page.dart';
import '../features/favourites/pages/home.page.dart';
import '../features/home/pages/home.page.dart';
import '../features/menu/pages/menu.page.dart';
import '../features/notifications/pages/notification.page.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomePage(),
    const FavouritesPage(),
    const NotificationPage(),
    const AccountPage(),
    const MenuPage(),
  ];
  getIndex() {
    if (widget.index != null) {
      setState(() {
        currentIndex = widget.index!;
      });
    } else {
      currentIndex = 0;
    }
  }

  @override
  void initState() {
    getIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return WillPopScope(

      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black,
          elevation: 10.0,
          iconSize: w * 0.08,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedLabelStyle: title.copyWith(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: w * 0.03),
          selectedLabelStyle: title.copyWith(
              color: AppColors.primary, fontWeight: FontWeight.w400, fontSize: w * 0.03),
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                activeIcon: Image.asset("asset/images/homecolor.png", width: 100, height: 30,),
                icon: Image.asset("asset/images/home.png", width: 100, height: 30,),
                label: translateString('arabic', 'english')),
            BottomNavigationBarItem(
                activeIcon: Image.asset("asset/images/deps-1.png", width: 100, height: 30,),
                icon:  Image.asset("asset/images/deps.png",  width: 100, height: 30,),
                label: translateString('Categories', 'الأقسام')),
            BottomNavigationBarItem(
              activeIcon: Image.asset("asset/images/cartcolor.png", width: 100, height: 30,),
              icon:  Image.asset("asset/images/cart.png",  width: 100, height: 30,),

              label: translateString("cart", "عربة التسوق"),),

            BottomNavigationBarItem(
              activeIcon: Image.asset("asset/images/heartcolor.png", width: 100, height: 30,),
              icon:  Image.asset("asset/images/heart.png",  width: 100, height: 30,),
              label: translateString("favourite", "المفضلة"),),
            BottomNavigationBarItem(
              activeIcon: Image.asset("asset/images/profilecolor.png", width: 100, height: 30,),
              icon:  Image.asset("asset/images/profile.png",  width: 100, height: 30,),
              label: translateString("my account", "الحساب"),),
          ],
        ),
        body: Center(
          child:screens[currentIndex],
        ),
      ),
    );
  }
}
