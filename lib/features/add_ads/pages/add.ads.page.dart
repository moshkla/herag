import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/business%20logic/appCubit/appcubit_cubit.dart';
import 'package:herag/core/models/home_model.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/features/add_ads/pages/create_ad_page.dart';
import 'package:herag/functions/cashed_network_image.dart';
import 'package:herag/theme/text_styles.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/page_app_bar.dart';
import '../../../theme/app_colors.dart';

import 'commition_agreement_page.dart';

class AddAdsPage extends StatefulWidget {
  const AddAdsPage({Key? key}) : super(key: key);

  @override
  State<AddAdsPage> createState() => _AddAdsPageState();
}

class _AddAdsPageState extends State<AddAdsPage> {
  var bloc = GetIt.I<AppCubit>();
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            pageAppBar(pageTitle: "select_ad_type".tr()),
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 2,
                itemBuilder: (c, i) => ExpandedItem(
                      categories: bloc.state.categories?[i],
                    )),
          ],
        ),
      ),
    );
  }
}

class ExpandedItem extends StatefulWidget {
  const ExpandedItem({
    Key? key,
    required this.categories,
  }) : super(key: key);
  final Categories? categories;

  @override
  State<ExpandedItem> createState() => _ExpandedItemState();
}

class _ExpandedItemState extends State<ExpandedItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionPanelList(
          elevation: 0,
          animationDuration: const Duration(milliseconds: 500),
          children: [
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                    leading: Container(
                      width: Si.ds! * 5,
                      child: customCachedNetworkImage(
                          url: widget.categories?.image ?? '',
                          context: context,
                          fit: BoxFit.cover),
                    ),
                    title: Text(
                      widget.categories?.title ?? '',
                      style: title,
                    ));
              },
              body: Column(
                children: List.generate(
                    widget.categories?.children?.length ?? 0,
                    (index) => ListTile(
                          onTap: () {
                            MagicRouter.navigateTo(CommissionAgreement(
                              catId:
                                  widget.categories?.children?[index].id ?? 0,
                            ));
                          },
                          title: Text(
                            widget.categories?.children?[index].title ?? '',
                            style: subTitle,
                          ),
                        )),
              ),
              isExpanded: _expanded,
              canTapOnHeader: true,
            ),
          ],
          dividerColor: Colors.grey,
          expansionCallback: (panelIndex, isExpanded) {
            _expanded = !_expanded;
            setState(() {});
          },
        ),
      ],
    );
  }
}
