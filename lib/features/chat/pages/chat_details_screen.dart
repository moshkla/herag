import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/features/auth/blocs/auth.cubit.dart';
import 'package:herag/features/chat/bloc/chat_cubit.dart';
import 'package:herag/features/chat/bloc/chat_state.dart';

import '../../../core/models/message_model.dart';

class ChatDetailsScreen extends StatelessWidget {
  ChatDetailsScreen({
    Key? key,
    this.reciverId,
  }) : super(key: key);

  var messageController = TextEditingController();
  var bloc = GetIt.I<ChatCubit>();
  var user = GetIt
      .I<AuthCubit>()
      .state
      .profileModel
      ?.body
      ?.user;
  final reciverId;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocConsumer<ChatCubit, ChatStates>(
          bloc: bloc,
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage('${user?.image}'),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('${user?.name}'),
                  ],
                ),
              ),
              body:
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          {
                            var message = bloc.messages[index];

                            if (bloc.userId == message.senderId)
                              return buildMyMessage(message);

                            return buildMessage(message);
                          }
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(
                              height: 15.0,
                            ),
                        itemCount: bloc.messages.length),
                    Container(
                      decoration: BoxDecoration(
                        border:
                        Border.all(color: Colors.grey[300]!, width: 1.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: messageController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type message here ..',
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.blue,
                            child: MaterialButton(
                              onPressed: () {
                                bloc.sendMessage(
                                    reciverId: reciverId,
                                    dateTime: DateTime.now().toString(),
                                    text: messageController.text);
                              },
                              minWidth: 1.0,
                              child: Icon(
                                Icons.send,
                                size: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            );
          },
        );
      },
    );
  }
}

Widget buildMessage(MessageModel model) =>
    Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
            ),
          ),
          child: Text('${model.text}')),
    );

Widget buildMyMessage(MessageModel model) =>
    Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(10.0),
            topStart: Radius.circular(10.0),
            topEnd: Radius.circular(10.0),
          ),
        ),
        child: Text(model.text.toString()),
      ),
    );
