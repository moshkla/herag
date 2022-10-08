import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:herag/core/constants/colors.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/core/utiles/size_config.dart';

class NotificationUtils {
  showLoading() {
    return const NewOverLay();
  }

  showLoadingDialog() {
    Dialog dialog = const Dialog(
      backgroundColor: Colors.transparent,
      child: NewOverLay(),
    );
    return showDialog(
        context: MagicRouter.currentContext,
        builder: (BuildContext context) => dialog);
  }

  hideLoading() {
    MagicRouter.pop();
  }

  // showSnackBar(
  //     {String? content,
  //     Color? textColor,
  //     Color backgroundColor = Colors.black}) {
  //   Get.rawSnackbar(
  //       message: content,
  //       backgroundColor: backgroundColor,
  //       snackPosition: SnackPosition.BOTTOM);
  // }

  showErrorSnackBar(String content, {String? title}) {
    ScaffoldMessenger.of(MagicRouter.currentContext).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: SnackBarContent(
          message: content,
          success: false,
          title: title,
        )));
  }

  showSuccessSnackBar(String content, {String? title}) {
    ScaffoldMessenger.of(MagicRouter.currentContext).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: SnackBarContent(
          message: content,
          success: true,
          title: title,
        )));
  }
}

class NewOverLay extends StatefulWidget {
  const NewOverLay({Key? key}) : super(key: key);

  @override
  _NewOverLayState createState() => _NewOverLayState();
}

class _NewOverLayState extends State<NewOverLay> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Center(
        child: SpinKitPouringHourGlass(
          size: SizeConfig.defaultSize! * 10,
          color: kMainColor,
          duration: const Duration(milliseconds: 1000),
        ),
      ),
    );
  }
}

class SnackBarContent extends StatelessWidget {
  const SnackBarContent(
      {Key? key,
      this.title = "alert",
      required this.message,
      required this.success})
      : super(key: key);
  final String? title;
  final String message;
  final bool success;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: SizeConfig.defaultSize! * 10,
          decoration: BoxDecoration(
            color: success ? Colors.green : Colors.red,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                // const SizedBox(width: 62),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title?.tr ?? "",
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        message,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.defaultSize! * 1.3,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 16,
          child: SizedBox(
            height: SizeConfig.defaultSize!*20,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
              child: Stack(
                children: [
                  SvgPicture.asset(
                    "assets/images/bubbles.svg",
                    height: 48,
                    width: 40,
                    color:
                        success ? Colors.greenAccent : Colors.redAccent.shade700,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: -20,
            left: 0,
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(Get.context!).clearSnackBars();
              },
              child: Stack(
                children: [
                  Icon(
                    Icons.chat_bubble,
                    size: 40,
                    color: success ? Colors.greenAccent : Colors.redAccent,
                  ),
                  const Positioned(
                    top: 10,
                    left: 10,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
