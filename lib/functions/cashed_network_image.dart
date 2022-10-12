import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/app_assets.dart';

customCachedNetworkImage(
    {required String url, required context, required BoxFit fit,Color? color}) {
  try {
    if (url == "") {
      return Center(
        child: Image.asset(
          AppAssets.logo,
          fit: BoxFit.fitWidth,
          color: color??null,
        ),
      );
    } else {
      return Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: (Uri.parse(url).isAbsolute)
            ? CachedNetworkImage(
                imageUrl: url,
                fit: fit,
            color: color??null,
            placeholder: (context, url) => Center(
                  child: Image.asset(
                        AppAssets.logo,
                        fit: fit,
                    color: color??null,

                  ),
                ),
                errorWidget: (context, url, error) {
                  return Center(
                    child: Image.asset(
                      AppAssets.logo,
                      fit: fit,
                      color: color??null,

                    ),
                  );
                })
            : Center(
              child: Image.asset(
                  AppAssets.logo,
                  fit: fit,
                ),
            ),
      );
    }
  } catch (e) {
    print(e.toString());
  }
}
