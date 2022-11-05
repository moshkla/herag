import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/business%20logic/appCubit/appcubit_cubit.dart';
import 'package:herag/theme/text_styles.dart';

import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/page_app_bar.dart';
import 'package:flutter_html/flutter_html.dart';

class TermsAndConditions extends StatelessWidget {
  TermsAndConditions({Key? key}) : super(key: key);
  var bloc = GetIt.I<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Scaffold(
        body: BlocBuilder(
          bloc: bloc,
          builder: (c, s) {
            return RefreshIndicator(
              onRefresh: () async {
                await bloc.getConstants();
              },
              child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  primary: false,
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          const pageAppBar(
                            pageTitle: 'سياسة التطبيق',
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Html(
                              data: context.locale == 'ar'
                                  ? GetIt.I<AppCubit>()
                                          .constantsModel
                                          ?.body
                                          ?.terms
                                          ?.ar ??
                                      ''
                                  : GetIt.I<AppCubit>()
                                          .constantsModel
                                          ?.body
                                          ?.terms
                                          ?.en ??
                                      '',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            );
          },
        ),
      ),
    );
  }
}
