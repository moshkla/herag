import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/business%20logic/appCubit/appcubit_cubit.dart';

import '../../../../core/utiles/size_config.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/styles.dart';
import '../../../../theme/text_styles.dart';

class SubCatItem extends StatelessWidget {
  SubCatItem({Key? key, required this.index}) : super(key: key);

  final int index;
  final bloc = GetIt.I<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (BuildContext context, state) {
        return Container(
          width: Si.ds! * 10,
          decoration: boxDecoration(
              withBorder: false,
              solidColor: AppColors.primary.withOpacity(0.1)),
          child: Center(
            child: Text(bloc.state.children![index].title!,
                style: subTitle.copyWith(color: Colors.black)),
          ),
        );
      },
    );
  }
}
