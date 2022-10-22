import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:herag/core/router/router.dart';
import 'package:herag/theme/styles.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/custom_buttons_widget.dart';
import '../../../core/widgets/page_app_bar.dart';
import '../../../theme/text_styles.dart';
import 'create_ad_page.dart';

class CommissionAgreement extends StatefulWidget {
  const CommissionAgreement({Key? key}) : super(key: key);

  @override
  State<CommissionAgreement> createState() => _CommissionAgreementState();
}

class _CommissionAgreementState extends State<CommissionAgreement> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pageAppBar(
                pageTitle:
                "commission_agreement".tr()),
            const VerticalSpace(value: 1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'بسم الله الرحمن الرحيم\n'
                  ' قال الله تعالى:" وَأَوْفُواْ بِعَهْدِ اللهِ إِذَا عَاهَدتُّمْ وَلاَ تَنقُضُواْ الأَيْمَانَ بَعْدَ تَوْكِيدِهَا وَقَدْ جَعَلْتُمُ اللهَ عَلَيْكُمْ كَفِيلاً \n"صدق الله العظيم',
                  style: title.copyWith(color: Colors.black..withOpacity(0.7)),
                ),
              ),
            ),
            const VerticalSpace(value: 2),
            Container(
              height: Si.ds! * 20,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        isChecked = value!;
                        setState(() {});
                      }),
                  Expanded(
                    child: Text(
                      '* اتعهد واقسم بالله أنا المعلن أن أدفع عمولة الموقع وهي 1% من قيمة البيع سواء تم البيع عن طريق الموقع أو بسببه.',
                      style: title,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration:
                    boxDecoration(withBorder: true, borderColor: Colors.red),
                child: Text(
                  'ملاحظة: عمولة الموقع هي على المعلن ولاتبرأ ذمة المعلن من العمولة إلا في حال دفعها.',
                  style: subTitle.copyWith(color: Colors.black),
                ),
              ),
            ),
            const VerticalSpace(value: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomGeneralButton(
                  text: 'continue'.tr(),
                  onTap: () {
                    MagicRouter.navigateTo(const CreateAdPage());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
