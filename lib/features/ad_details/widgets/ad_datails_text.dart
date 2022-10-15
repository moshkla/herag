import 'package:flutter/material.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/widgets/custom_buttons_widget.dart';
import 'package:herag/theme/app_colors.dart';
import 'package:herag/theme/input_decoration.dart';
import 'package:herag/theme/styles.dart';

import '../../../core/utiles/size_config.dart';
import '../../../theme/text_styles.dart';

class AdDetailsText extends StatelessWidget {
  const AdDetailsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(value: 1),
          Text(
            'إستراحة وشاليهات ليالي القمر بالحمراء',
            style: titleBold.copyWith(
                color: Colors.black,
                fontSize: Si.ds! * 4,
                fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.deepOrange,
                    size: Si.ds! * 2,
                  ),
                  Text('جدة',
                      style: hint.copyWith(
                        color: Colors.deepOrange,
                      )),
                ],
              ),
              Text(
                '2,000 sar',
                style: subTitleBold,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    color: Colors.green,
                    size: Si.ds! * 2,
                  ),
                  Text(
                    'أبو عدنان',
                    style: hint.copyWith(color: Colors.green),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    size: Si.ds! * 2,
                  ),
                  const HorizontalSpace(value: 1),
                  Text(
                    'منذ دقيقة',
                    style: hint,
                  ),
                ],
              ),
            ],
          ),
          const VerticalSpace(value: 2),
          Text(
            'يجمع المستشفى التعليمي بين مساعدة الناس والتدريس لطلاب الطب والتمريض. عادة ما تسمى المنشأة الطبية الأصغر من المستشفى بالعيادة. المستشفيات لديها مجموعة من الأقسام (مثل الجراحة، والعناية العاجلة) والوحدات المتخصصة مثل طب القلب. بعض المستشفيات لديها أقسام للمرضى غير المقيمين وبعضها يحتوي على وحدات علاجية للأمراض المزمنة. وتشمل وحدات الدعم الشائعة مثل: الصيدلية، وعلم الأمراض، والأشعة.'
            "عادةً ما يتم تمويل المستشفيات من قبل القطاع العام، أو المؤسسات الصحية (سواء ربحية أو غير ربحية)، أو شركات التأمين الصحي، أو المؤسسات الخيرية، بما في ذلك التبرعات الخيرية المباشرة. تاريخيًا، غالبًا ما تم تأسيس المستشفيات وتمويلها بموجب أوامر دينية، أو من قبل أفراد وقادة خيريين."
            ' وفي الوقت الحالي، يعمل في المستشفيات عدد كبير من الأطباء المتخصصين، والجراحين، والممرضين والممارسين في قطاع الرعاية الصحية، في حين كان يتم تنفيذ هذا العمل في الماضي من قبل أعضاء المؤسسات الدينية التأسيسية أو المتطوعين. ومع ذلك، هناك العديد من التنظيمات الدينية الكاثوليكية، مثل الألكسيين وتجمع أخوات بون سيكورس التي لا تزال تركز على المستشفيات في أواخر 1990s، وكذلك تدير العديد من الطوائف المسيحية الأخرى، بما في ذلك الميثوديون واللوثريون المستشفيات. وفقًا للمعنى الأصلي للكلمة الإنجليزية، كانت المستشفيات في الأصل "أماكن ضيافة"، ولا يزال هذا المعنى محفوظًا في أسماء بعض المؤسسات مثل مستشفى رويال تشيلسي، الذي أنشئ في عام 1681 كبيت للتقاعد والتمريض للجنود المخضرمين.'
            'وفي الوقت الحالي، يعمل في المستشفيات عدد كبير من الأطباء المتخصصين، والجراحين، والممرضين والممارسين في قطاع الرعاية الصحية، في حين كان يتم تنفيذ هذا العمل في الماضي من قبل أعضاء المؤسسات الدينية التأسيسية أو المتطوعين. ومع ذلك، هناك العديد من التنظيمات الدينية الكاثوليكية، مثل الألكسيين وتجمع أخوات بون سيكورس التي لا تزال تركز على المستشفيات في أواخر 1990s، وكذلك تدير العديد من الطوائف المسيحية الأخرى، بما في ذلك الميثوديون واللوثريون المستشفيات. وفقًا للمعنى الأصلي للكلمة الإنجليزية، كانت المستشفيات في الأصل "أماكن ضيافة"، ولا يزال هذا المعنى محفوظًا في أسماء بعض المؤسسات مثل مستشفى رويال تشيلسي، الذي أنشئ في عام 1681 كبيت للتقاعد والتمريض للجنود المخضرمين.',
            style: hint.copyWith(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          const VerticalSpace(value: 2),
          Container(
            decoration:
                boxDecoration(withBorder: true, borderColor: Colors.red),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Icon(
                  Icons.warning_amber,
                  color: Colors.red,
                ),
                const HorizontalSpace(value: 1),
                Expanded(
                    child: Text(
                  'تجنب قبول الشيكات والمبالغ النقدية واحرص على التحويل البنكي المحلي',
                  style: hint.copyWith(color: Colors.black),
                  maxLines: 2,
                )),
              ],
            ),
          ),
          const VerticalSpace(value: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              decoration: boxDecoration(solidColor: AppColors.primary),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/noti_on.png',
                      color: Colors.white,
                      height: Si.ds! * 4,
                    ),
                    const HorizontalSpace(value: 2),
                    Text(
                      translateString('مراسلة المعلن', 'Send Advertiser'),
                      style: title.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const VerticalSpace(value: 2),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: boxDecoration(),
            child: Column(
              children: [
                TextFormField(
                  decoration: inputDecoration(
                      hint: translateString('اكتب سؤالك للمعلن هنا . . .',
                          'Enter your question to Advertizer here . . . ')),
                  maxLines: 4,
                ),
                const VerticalSpace(value: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const Icon(Icons.ac_unit),
                      const HorizontalSpace(value: 0.5),
                      Text(translateString('متابعة الردور',
                          'Follow Replies'),style: subTitle,)
                    ],),

                    SizedBox(
                      width: Si.ds!*15,
                      child: CustomGeneralButton(text: translateString('ارسال',
                          'Send'), onTap: (){}),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
