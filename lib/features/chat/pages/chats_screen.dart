import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/features/chat/bloc/chat_cubit.dart';
import 'package:herag/features/chat/bloc/chat_state.dart';

class ChatsScreen extends StatefulWidget {
  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  var bloc = GetIt.I<ChatCubit>();

  @override
  void initState() {
    super.initState();
    bloc.getUsers();
    print('hello');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatCubit, ChatStates>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildChatItem(bloc.users?[index] ?? '', context),
            itemCount: bloc.users?.length,
          );
        },
      ),
    );
  }

  Widget buildChatItem(String user, context) => InkWell(
        onTap: () {
          //navigateTo(context, HtmlScreen());
          //   navigateTo(
          //     context,
          //     ChatDetailsScreen(
          //       userModel: model,
          //     ),
          //   );
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              // CircleAvatar(
              //   radius: 25.0,
              //   backgroundImage: NetworkImage(
              //     '${model.image}',
              //   ),
              // ),
              SizedBox(
                width: 15.0,
              ),
              Text(
                '${user}',
                style: TextStyle(
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      );
}
