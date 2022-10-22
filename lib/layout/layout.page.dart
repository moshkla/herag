import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/router/router.dart';

import '../core/utiles/size_config.dart';
import '../features/account/pages/account_page.dart';
import '../features/add_ads/pages/add.ads.page.dart';
import '../features/favourites/pages/favourites.page.dart';
import '../features/home/pages/pages/home.page.dart';
import '../features/menu/pages/menu.page.dart';
import '../features/notifications/pages/notification.page.dart';
import '../theme/app_colors.dart';

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
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            MagicRouter.navigateTo(const AddAdsPage());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Si.ds! * 2),
            topRight: Radius.circular(Si.ds! * 2),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // Fixed
            backgroundColor: AppColors.primary,
            unselectedItemColor: Colors.green,
            elevation: 10.0,
            iconSize: w * 0.08,
            selectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    "assets/images/home_on.png",
                    height: Si.ds! * 3,
                  ),
                  icon: Image.asset(
                    "assets/images/home_off.png",
                    height: Si.ds! * 3,
                  ),
                  label: 'home'.tr()),
              BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    "assets/images/fav_on.png",
                    height: Si.ds! * 3,
                  ),
                  icon: Image.asset(
                    "assets/images/fav_off.png",
                    height: Si.ds! * 3,
                  ),
                  label: 'favourits'.tr()),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  "assets/images/noti_on.png",
                  height: Si.ds! * 3,
                ),
                icon: Image.asset(
                  "assets/images/noti_off.png",
                  height: Si.ds! * 3,
                ),
                label: 'notifications'.tr(),
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  "assets/images/person_on.png",
                  width: 100,
                  height: 30,
                ),
                icon: Image.asset(
                  "assets/images/person_off.png",
                  width: 100,
                  height: 30,
                ),
                label: "account".tr(),
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  "assets/images/menu_on.png",
                  width: 100,
                  height: 30,
                ),
                icon: Image.asset(
                  "assets/images/menu_off.png",
                  width: 100,
                  height: 30,
                ),
                label:  "menu".tr(),
              ),
            ],
          ),
        ),
        body: Center(
          child: screens[currentIndex],
        ),
      ),
    );
  }
}
