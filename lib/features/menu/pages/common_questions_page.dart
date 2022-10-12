import 'package:flutter/material.dart';
import 'package:herag/theme/text_styles.dart';

import '../../../core/utiles/size_config.dart';
import '../../../core/widgets/page_app_bar.dart';

class CommonQuestions extends StatelessWidget {
  const CommonQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Si.screenHeight,
          child: Column(
            children: [
              pageAppBar(
                pageTitle: 'سياسة التطبيق',
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "يجمع المستشفى التعليمي بين مساعدة الناس والتدريس لطلاب الطب والتمريض. عادة ما تسمى المنشأة الطبية الأصغر من المستشفى بالعيادة. المستشفيات لديها مجموعة من الأقسام (مثل الجراحة، والعناية العاجلة) والوحدات المتخصصة مثل طب القلب. بعض المستشفيات لديها أقسام للمرضى غير المقيمين وبعضها يحتوي على وحدات علاجية للأمراض المزمنة. وتشمل وحدات الدعم الشائعة مثل: الصيدلية، وعلم الأمراض، والأشعة."
                  " عادةً ما يتم تمويل المستشفيات من قبل القطاع العام، أو المؤسسات الصحية (سواء ربحية أو غير ربحية)، أو شركات التأمين الصحي، أو المؤسسات الخيرية، بما في ذلك التبرعات الخيرية المباشرة. تاريخيًا، غالبًا ما تم تأسيس المستشفيات وتمويلها بموجب أوامر دينية، أو من قبل أفراد وقادة خيريين."
                  " عادةً ما يتم تمويل المستشفيات من قبل القطاع العام، أو المؤسسات الصحية (سواء ربحية أو غير ربحية)، أو شركات التأمين الصحي، أو المؤسسات الخيرية، بما في ذلك التبرعات الخيرية المباشرة. تاريخيًا، غالبًا ما تم تأسيس المستشفيات وتمويلها بموجب أوامر دينية، أو من قبل أفراد وقادة خيريين."
                  " عادةً ما يتم تمويل المستشفيات من قبل القطاع العام، أو المؤسسات الصحية (سواء ربحية أو غير ربحية)، أو شركات التأمين الصحي، أو المؤسسات الخيرية، بما في ذلك التبرعات الخيرية المباشرة. تاريخيًا، غالبًا ما تم تأسيس المستشفيات وتمويلها بموجب أوامر دينية، أو من قبل أفراد وقادة خيريين.",
                  style: subTitle.copyWith(color: Colors.black),
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
  ExpandedItem({Key? key,})
      : super(key: key);

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
                          children: [
                          ],
                        ),
                      ),
                    ),
                  );
                },
                body: Column(
                  children: [],
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
