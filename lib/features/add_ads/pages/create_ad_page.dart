import 'package:flutter/material.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/utiles/size_config.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';
import 'package:herag/core/widgets/page_app_bar.dart';
import 'package:herag/theme/styles.dart';

import '../../../core/widgets/custom_drop_down.dart';
import '../../../theme/input_decoration.dart';
import '../../../theme/text_styles.dart';

class CreateAdPage extends StatefulWidget {
  const CreateAdPage({Key? key}) : super(key: key);

  @override
  State<CreateAdPage> createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {
  bool isChecked = false;
  int? groubValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pageAppBar(
                pageTitle: translateString('تفاصيل الاعلان', 'Ad details')),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomDropDown(
                    items: [],
                    text: 'اختر المنطقة',
                  ),
                  const VerticalSpace(value: 1),
                  const CustomDropDown(
                    items: [],
                    text: 'اختر المدينة',
                  ),
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
                  const CustomDropDown(
                    items: [],
                    text: 'عنوان الاعلان',
                  ),
                  const VerticalSpace(value: 1),
                  const CustomDropDown(
                    items: [],
                    text: 'جراج السيارات',
                  ),
                  const VerticalSpace(value: 1),
                  const CustomDropDown(
                    items: [],
                    text: 'بيع',
                  ),
                  const VerticalSpace(value: 1),
                  TextFormField(
                    decoration:
                        inputDecoration(hint: 'رقم الجوال او وسيلة التواصل'),
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
                      decoration: inputDecoration(hint: 'ادخل السعر'),
                    ),
                  const VerticalSpace(value: 2),
                  TextFormField(
                    decoration: inputDecoration(hint: 'نص الاعلان'),
                    maxLines: 4,
                  ),
                  const VerticalSpace(value: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: CustomGeneralButton(
                        text: translateString('ارسال', 'Send'), onTap: () {}),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
