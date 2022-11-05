import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/business%20logic/appCubit/appcubit_cubit.dart';
import 'package:herag/theme/text_styles.dart';

import '../../../core/widgets/page_app_bar.dart';

class CommonQuestions extends StatelessWidget {
  CommonQuestions({Key? key}) : super(key: key);
  var bloc = GetIt.I<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: ()async {
          await  bloc.getFaqs();
        },
        child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
          shrinkWrap: true,
          primary: false,
          children:[ Column(
            children: [
              const pageAppBar(
                pageTitle: 'أسألة متكررة',
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: bloc.faqsModel?.body?.questions?.length,
                      itemBuilder: (c, index) => Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ExpandedItem(
                              question: bloc.faqsModel?.body?.questions?[index]
                                      .question ??
                                  '',
                              answer: bloc.faqsModel?.body?.questions?[index]
                                  .answer??'',
                            ),
                          ))),
            ],
          ),]
        ),
      ),
    );
  }
}

class ExpandedItem extends StatefulWidget {
  const ExpandedItem({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);
  final String? question;
  final String? answer;

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
                  widget.question!,
                  style: subTitle,
                ));
              },
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.answer!,
                      style: subHint.copyWith(
                          color: Colors.black.withOpacity(0.7)),
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
