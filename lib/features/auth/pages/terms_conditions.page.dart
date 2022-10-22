import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:herag/core/constants/constants.dart';
import 'package:herag/core/utiles/size_config.dart';

import '../../../theme/app_assets.dart';
import '../../../theme/styles.dart';
import '../../../theme/text_styles.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  int? selectedIndex;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Si().init(context);
    return Scaffold(
      body: Container(
        height: Si.screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: Si.ds! * 8, end: Si.ds! * 8, top: Si.ds! * 6),
                child: Center(
                  child: Image.asset(AppAssets.logo),
                ),
              ),
              Padding(
                padding: edgeInsetsSymmetric(h: 2, v: 5),
                child: Container(
                  padding: edgeInsetsSymmetric(h: 2, v: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Si.ds!),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Text(
                       'terms'.tr(),
                        style: title,
                      ),
                      const VerticalSpace(value: 2),
                      Text(
                        'يجمع المستشفى التعليمي بين مساعدة الناس والتدريس لطلاب الطب والتمريض. عادة ما تسمى المنشأة الطبية الأصغر من المستشفى بالعيادة. المستشفيات لديها مجموعة من الأقسام (مثل الجراحة، والعناية العاجلة) والوحدات المتخصصة مثل طب القلب. بعض المستشفيات لديها أقسام للمرضى غير المقيمين وبعضها يحتوي على وحدات علاجية للأمراض المزمنة. وتشمل وحدات الدعم الشائعة مثل: الصيدلية، وعلم الأمراض، والأشعة.'
                        ' عادةً ما يتم تمويل المستشفيات من قبل القطاع العام، أو المؤسسات الصحية (سواء ربحية أو غير ربحية)، أو شركات التأمين الصحي، أو المؤسسات الخيرية، بما في ذلك التبرعات الخيرية المباشرة. تاريخيًا، غالبًا ما تم تأسيس المستشفيات وتمويلها بموجب أوامر دينية، أو من قبل أفراد وقادة خيريين'
                        'وفي الوقت الحالي، يعمل في المستشفيات عدد كبير من الأطباء المتخصصين، والجراحين، والممرضين والممارسين في قطاع الرعاية الصحية، في حين كان يتم تنفيذ هذا العمل في الماضي من قبل أعضاء المؤسسات الدينية التأسيسية أو المتطوعين. ومع ذلك، هناك العديد من التنظيمات الدينية الكاثوليكية، مثل الألكسيين وتجمع أخوات بون سيكورس التي لا تزال تركز على المستشفيات في أواخر 1990s، وكذلك تدير العديد من الطوائف المسيحية الأخرى، بما في ذلك الميثوديون واللوثريون المستشفيات. وفقًا للمعنى الأصلي للكلمة الإنجليزية، كانت المستشفيات في الأصل "أماكن ضيافة"، ولا يزال هذا المعنى محفوظًا في أسماء بعض المؤسسات مثل مستشفى رويال تشيلسي، الذي أنشئ في عام 1681 كبيت للتقاعد والتمريض للجنود المخضرمين.'
                        '  وفي الوقت الحالي، يعمل في المستشفيات عدد كبير من الأطباء المتخصصين، والجراحين، والممرضين والممارسين في قطاع الرعاية الصحية، في حين كان يتم تنفيذ هذا العمل في الماضي من قبل أعضاء المؤسسات الدينية التأسيسية أو المتطوعين'
                        'ومع ذلك، هناك العديد من التنظيمات الدينية الكاثوليكية، مثل الألكسيين وتجمع أخوات بون سيكورس التي لا تزال تركز على المست'
                        'شفيات في أواخر 1990s، وكذلك تدير العديد من الطوائف المسيحية الأخرى، بما في ذلك الميثوديون واللوثريون المستشفيات. وفقًا لل'
                        ' معنى الأصلي للكلمة الإنجليزية، كانت المستشفيات في الأصل "أماكن ضيافة'
                        '، ولا يزال هذا المعنى محفوظًا في',
                        style:
                            hint.copyWith(color: Colors.black.withOpacity(0.7)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
