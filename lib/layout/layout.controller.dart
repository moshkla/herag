// import 'package:flutter/material.dart';
//
// import '../features/account/pages/account_page.dart';
// import '../features/favourites/pages/home.page.dart';
// import '../features/home/pages/home.page.dart';
// import '../features/menu/pages/menu.page.dart';
// import '../features/notifications/pages/notification.page.dart';
//
// class MainNavigationController extends st{
//   int currentIndex = 0;
//
//   final List<PageData> pages = [
//     PageData(index:0,icon: 'assets/images/home.svg', page: const HomePage(), title: "home"),
//     PageData(index:1,icon: 'assets/images/projects.svg', page: FavouritesPage(), title: "projects"),
//     PageData(index:2,icon: 'assets/images/articles.svg', page:const NotificationPage(), title: "blog"),
//     PageData(index:3,icon: 'assets/images/profile.svg', page: const AccountPage(), title: "account"),
//     PageData(index:3,icon: 'assets/images/profile.svg', page: const MenuPage(), title: "account"),
//   ];
//
//   PageData get currentPage {
//     return pages[currentIndex];
//   }
//
//   changeIndex(int index) {
//     currentIndex = index;
//   }
// }
//
// class PageData {
//   int index;
//   Widget page;
//   String title;
//   String icon;
//   PageData({required this.index,required this.icon, required this.page, required this.title});
// }
