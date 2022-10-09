import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majdia/features/account/blocs/account.controller.dart';
import 'package:majdia/theme/app_colors.dart';

import '../../../core/models/rental_request_models/rental_requests_list_model.dart';
import '../../../utils/size_config.dart';

class RentalRequestsWidget extends StatefulWidget {
  const RentalRequestsWidget({
    Key? key,
    required this.rentalRequestsListModel,
  }) : super(key: key);
  final RentalRequestsListModel rentalRequestsListModel;

  @override
  State<RentalRequestsWidget> createState() => _RentalRequestsWidgetState();
}

class _RentalRequestsWidgetState extends State<RentalRequestsWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionPanelList(
          elevation: 0,
          animationDuration: const Duration(milliseconds: 1000),
          children: [
            ExpansionPanel(

              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text(
                    'all_rental_requests'.tr,
                    style: context.textTheme.titleLarge,
                  ),
                );
              },
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (c, i) => OfferItem(
                      rentalRequestsListModel: widget.rentalRequestsListModel,
                      index: i),
                  itemCount: widget.rentalRequestsListModel.data?.length ?? 0,
                  separatorBuilder: (BuildContext context, int index) =>
                      const VerticalSpace(value: 1),
                ),
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

Widget OfferItem(
    {required RentalRequestsListModel rentalRequestsListModel,
    required int index}) {
  return Container(
      color: AppColors.textLight,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(rentalRequestsListModel.data![index].createdAt!),
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.find<AccountController>().showRentalRequest(rentalId: rentalRequestsListModel.data![index].id!);
                  }, icon: const Icon(Icons.remove_red_eye_outlined)),
              IconButton(
                  onPressed: () {
                    Get.find<AccountController>().deleteRentalRequest(
                        rentalId: rentalRequestsListModel.data![index].id);
                  },
                  icon: const Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red,
                  )),
            ],
          )
        ],
      ));
}
