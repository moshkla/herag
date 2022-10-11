import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utiles/size_config.dart';

class pageAppBar extends StatelessWidget {
  const pageAppBar({
    Key? key,
    required this.title,
    this.onPress,
    this.actions, this.color,
  }) : super(key: key);
  final String title;
  final Widget? actions;
  final Color? color;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: onPress ??
                          () {
                        Get.back();
                      },
                  icon: Icon(
                      Icons.arrow_back),
                  color:color?? Colors.white,
                ),
                HorizontalSpace(value: 1),
                Text(
                  title.tr,
                  style: context.textTheme.titleLarge!
                      .copyWith(color:color?? Colors.white),
                ),
              ],
            ),
            actions ?? Container()
          ],
        ),
      ),
    );
  }
}

// Widget pageAppBar({required String title, bool showOptions = false,VoidCallback? onPress}) {
//   return AppBar(
//     backgroundColor: Colors.transparent,
//
//     title: Text(
//       title.tr,
//       style:  TextStyle(color: LocalStorageUtils.isDarkMode == true ? Colors.white : Colors.black,),
//     ),
//     centerTitle: true,
//     leading: IconButton(
//       onPressed:onPress?? () {
//         Get.back();
//       },
//       icon: const Icon(Icons.arrow_back_ios),
//       color: LocalStorageUtils.isDarkMode == true ? Colors.white : Colors.black,
//     ),
//     actions: !showOptions ? null : [const OptionsMenuWidget()],
//   );
// }
