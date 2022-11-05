import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/business%20logic/appCubit/appcubit_cubit.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/utiles/size_config.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';
import 'package:herag/core/widgets/page_app_bar.dart';
import 'package:herag/theme/styles.dart';

import '../../../core/widgets/custom_drop_down.dart';
import '../../../theme/input_decoration.dart';
import '../../../theme/text_styles.dart';

class CreateAdPage extends StatefulWidget {
  const CreateAdPage({Key? key, required this.catId}) : super(key: key);
  final int catId;

  @override
  State<CreateAdPage> createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {
  bool isChecked = false;
  int? groubValue;
  var bloc = GetIt.I<AppCubit>();
  var name = TextEditingController();
  var price = TextEditingController();
  var phone = TextEditingController();
  var description = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: bloc,
        builder: (c, s) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pageAppBar(pageTitle: 'ad_details'.tr()),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomDropDown(
                        items: [],
                        text: 'اختر المنطقة',
                      ),
                      // const VerticalSpace(value: 1),
                      // const CustomDropDown(
                      //   items: [],
                      //   text: 'اختر المدينة',
                      // ),
                      const VerticalSpace(value: 2),
                      Text(
                        'تحميل الصور',
                        style: title,
                      ),
                      const VerticalSpace(value: 1),
                      SizedBox(
                        height: Si.ds! * 10,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            primary: false,
                            itemCount: 5,
                            itemBuilder: (c, index) => Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    decoration: boxDecoration(),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image.asset(
                                      'assets/images/ites.png',
                                      height: Si.ds! * 3,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                      ),
                      const VerticalSpace(value: 2),
                      TextFormField(
                        style: TextStyle(fontSize: Si.ds! * 2.5),
                        controller: name,
                        decoration: inputDecoration(hint: 'اسم المنتج'),
                      ),
                      const VerticalSpace(value: 1),

                      // const CustomDropDown(
                      //   items: [],
                      //   text: 'جراج السيارات',
                      // ),
                      // const VerticalSpace(value: 1),
                      // const CustomDropDown(
                      //   items: [],
                      //   text: 'بيع',
                      // ),
                      const VerticalSpace(value: 1),
                      TextFormField(
                        style: TextStyle(fontSize: Si.ds! * 2.5),
                        controller: phone,
                        decoration: inputDecoration(
                            hint: 'رقم الجوال او وسيلة التواصل'),
                      ),
                      const VerticalSpace(value: 1),
                      Row(
                        children: [
                          Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                          Text('إخفاء رقم الجوال',
                              style: hint.copyWith(
                                color: Colors.black.withOpacity(0.7),
                              )),
                        ],
                      ),
                      Text(
                        'هل ترغب بتحديد السعر ؟',
                        style: title,
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 0,
                              groupValue: groubValue,
                              onChanged: (int? value) {
                                setState(() {
                                  groubValue = value!;
                                });
                              }),
                          Text(
                            'نعم',
                            style: subTitle,
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: groubValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      groubValue = value!;
                                    });
                                  }),
                              Text(
                                'لا',
                                style: subTitle,
                              )
                            ],
                          ),
                        ],
                      ),
                      if (groubValue == 0)
                        TextFormField(
                          controller: price,
                          style: TextStyle(fontSize: Si.ds! * 2.5),
                          decoration: inputDecoration(hint: 'ادخل السعر'),
                        ),
                      const VerticalSpace(value: 2),
                      TextFormField(
                        controller: description,
                        style: TextStyle(fontSize: Si.ds! * 2.5),
                        decoration: inputDecoration(hint: 'نص الاعلان'),
                        maxLines: 4,
                      ),
                      const VerticalSpace(value: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: CustomGeneralButton(
                            text: 'send'.tr(),
                            onTap: () {
                              bloc.addNewPost(
                                  title: name.text,
                                  description: description.text,
                                  phone: phone.text,
                                  price: price.text,
                                  categoryId: widget.catId,
                                  areaId: 1);
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
