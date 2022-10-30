import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/business%20logic/appCubit/appcubit_cubit.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/custom_buttons_widget.dart';
import '../../../core/widgets/page_app_bar.dart';
import '../../../theme/input_decoration.dart';
import '../actions/contact_us_action.dart';

class ContactUs extends StatelessWidget {
  ContactUs({Key? key}) : super(key: key);
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              pageAppBar(
                pageTitle: 'contact_us'.tr(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const VerticalSpace(value: 2),
                    TextFormField(
                      controller: name,
                      decoration: inputDecoration(hint: 'الاسم'),
                    ),
                    const VerticalSpace(value: 2),
                    TextFormField(
                      controller: email,
                      decoration: inputDecoration(hint: 'البريد الالكتروني'),
                    ),
                    const VerticalSpace(value: 2),
                    TextFormField(
                      controller: phone,
                      decoration:
                          inputDecoration(hint: 'رقم الجوال او وسيلة التواصل'),
                    ),
                    const VerticalSpace(value: 2),
                    TextFormField(
                      controller: message,
                      decoration: inputDecoration(hint: 'رسالتك'),
                      maxLines: 4,
                    ),
                    const VerticalSpace(value: 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: CustomGeneralButton(
                          text: 'send'.tr(),
                          onTap: () {
                            GetIt.I<AppCubit>().contactUs(
                                name: name.text,
                                email: email.text,
                                phone: phone.text,
                                message: message.text);
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandedItem extends StatefulWidget {
  const ExpandedItem({
    Key? key,
  }) : super(key: key);

  @override
  State<ExpandedItem> createState() => _ExpandedItemState();
}

class _ExpandedItemState extends State<ExpandedItem> {
  bool _expanded = false;
  List<String> x = [];

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
                  title: SizedBox(
                    height: Si.ds! * 5,
                    child: Center(
                      child: Stack(
                        children: const [],
                      ),
                    ),
                  ),
                );
              },
              body: Column(
                children: const [],
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
