import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:majdia/features/account/blocs/account.controller.dart';
import 'package:majdia/theme/app_colors.dart';
import 'package:majdia/utils/local_storage.utils.dart';
import 'package:majdia/utils/size_config.dart';
import '../../../core/models/name_with_string_id_model.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_button.dart';
import '../blocs/request_attention_form_bloc.dart';
import '../widgets/interests.dart';
import '../widgets/profile_personal.dart';
import '../widgets/project_notes.dart';
import '../widgets/project_specifications.dart';

class RequestAttentionPage extends GetView<AccountController> {
  RequestAttentionPage({Key? key}) : super(key: key);

  late RequestAttentionFormBloc requestAttentionFormBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: pageAppBar(title: "request_attention".tr, showOptions: true),
      body: GetBuilder<AccountController>(
        initState: (_) {
          requestAttentionFormBloc = RequestAttentionFormBloc();
        },
        builder: (ctx) {
          return FormBlocListener(
            formBloc: requestAttentionFormBloc,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: SizeConfig.defaultSize!*35,
                    child: Stack(
                      children: [
                        PositionedDirectional(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(SizeConfig.defaultSize!),
                                    bottomRight: Radius.circular(SizeConfig.defaultSize!)),

                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.asset(
                                'assets/images/unit_bg.png',
                                width: Get.width,
                                height: SizeConfig.defaultSize! * 35,
                                fit: BoxFit.cover,
                              ),
                            )),
                        PositionedDirectional(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white.withOpacity(0.6),
                                      offset: Offset(SizeConfig.defaultSize! * 10, 0),
                                      spreadRadius: 2,
                                      blurRadius: 100),
                                ],
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              pageAppBar(title:'request_attention' ,color: Colors.black,),

                              Center(
                                child: Image.asset(
                                  "assets/images/logo.png",
                                  height: SizeConfig.defaultSize! * 10,
                                ),
                              ),

                              const VerticalSpace(value: 2),
                              Text(
                                LocalStorageUtils.locale == 'ar'
                                    ? controller
                                        .attentionRequestModel!.data!.intro!.ar!
                                    : controller
                                        .attentionRequestModel!.data!.intro!.en!,
                                style: context.textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpace(value: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Image.asset('assets/images/seperator.png'),
                  ),
                  const VerticalSpace(value: 1),
                  ProfilePersonal(
                    requestAttentionFormBloc: requestAttentionFormBloc,
                  ),
                  Interests(
                    requestAttentionFormBloc: requestAttentionFormBloc,
                  ),
                  ProjectSpecification(
                    requestAttentionFormBloc: requestAttentionFormBloc,
                  ),
                  Notes(
                    requestAttentionFormBloc: requestAttentionFormBloc,
                  ),
                  VerticalSpace(value: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownFieldBlocBuilder<NameWithStringId>(

                      key: const ValueKey("how_hear_about_us"),
                      showEmptyItem: false,
                      selectFieldBloc:requestAttentionFormBloc.howHearAboutUs,
                      decoration: InputDecoration(
                        label: Text('how_hear_about_us'.tr),
                      ),
                      itemBuilder: (context, item) => FieldItem(
                        child: Text(LocalStorageUtils.locale == 'ar'
                            ? item.name!
                            : item.id!.replaceAll('_', " ")),
                      ),
                    ),
                  ),
                  const VerticalSpace(value: 2),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                        title: 'req_attention'.tr,
                        onTap: () {
                          requestAttentionFormBloc.onSubmitting();
                        }),
                  ),
                  const VerticalSpace(value: 2),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
