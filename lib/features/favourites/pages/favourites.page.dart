import 'package:flutter/material.dart';
import 'package:herag/core/widgets/page_app_bar.dart';
import '../../../core/constants/constants.dart';
import '../../../core/widgets/home.item.dart';


class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          pageAppBar(
            pageTitle: translateString("المفضلة", "Favourits"),
            withoutBackBtn: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: (c, i) => HomeItem()),
          ),
        ],
      ),
    );
  }
}
