import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/business%20logic/appCubit/appcubit_cubit.dart';
import 'package:herag/theme/text_styles.dart';

import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/page_app_bar.dart';
import 'package:flutter_html/flutter_html.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Si.screenHeight,
          child: Column(
            children: [
              const pageAppBar(
                pageTitle: 'سياسة التطبيق',
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Html(
                 data: context.locale == 'ar' ?
               GetIt.I<AppCubit>().constantsModel
                  ?.body?.terms?.ar??'':
                  GetIt.I<AppCubit>().constantsModel
                      ?.body?.terms?.en??'',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
