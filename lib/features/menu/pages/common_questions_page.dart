import 'package:flutter/material.dart';
import 'package:herag/theme/text_styles.dart';

import '../../../core/widgets/page_app_bar.dart';

class CommonQuestions extends StatelessWidget {
  const CommonQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const pageAppBar(
                pageTitle: 'سياسة التطبيق',
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 10,
                      itemBuilder: (c, index) => const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ExpandedItem(),
                          ))),
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
          animationDuration: const Duration(milliseconds: 500),
          children: [
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                    title: Text(
                  'كيف أقوم بدفع عمولة الموقع؟',
                  style: subTitle,
                ));
              },
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى'
                      ' إضافة إلى زيادة عدد الحروف التى يولدها ',
                      style:
                          subHint.copyWith(color: Colors.black.withOpacity(0.7)),
                    ),
                  ),
                ],
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
