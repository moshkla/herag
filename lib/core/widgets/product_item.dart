import 'package:flutter/material.dart';
import 'package:herag/core/widgets/space_widget.dart';

import '../utiles/size_config.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: GridTile(
        child: Hero(
          tag: index,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: SizeConfig.defaultSize! * 22,
                  child: Image.asset(
                    'assets/images/item.png',
                  )),
              const VerticalSpace(value: 1),
              Text(
                'Title',
                style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.2),
              ),
              const VerticalSpace(value: 0.5),
              Expanded(
                  child: Text('Price SR',
                      style:
                          TextStyle(fontSize: SizeConfig.defaultSize! * 1.2))),
            ],
          ),
        ),
      ),
    );
  }
}
