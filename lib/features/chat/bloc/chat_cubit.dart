import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:herag/features/auth/blocs/auth.cubit.dart';

import '../../../core/models/message_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(InitialState());
  var userId = GetIt.I<AuthCubit>().userModel!.body?.user?.name;

  void sendMessage({
    required String? reciverId,
    required String? dateTime,
    required String? text,
  }) {
    MessageModel model = MessageModel(
      senderId: userId,
      receiverId: reciverId,
      dateTime: dateTime,
      text: text,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('chats')
        .doc(reciverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(AppSendMessageSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(AppSendMessageErrorState());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(reciverId)
        .collection('chats')
        .doc(userId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(AppSendMessageSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(AppSendMessageErrorState());
    });
  }

  List<MessageModel> messages = [];

  void getMessages({
    required String? receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(AppGetMessagesSuccessState());
    });
  }
  List<String>? users = [];

  void getUsers() {
    if (users?.isEmpty==true) {
      FirebaseFirestore.instance.collection('users').get().then((value) {
        print(value.docs);

        value.docs.forEach((element) {
          users!.add(element.data.toString());
        });
       // print(users);
        emit(AppGetAllUsersSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(AppGetAllUsersErrorState(error.toString()));
      });
    }
  }

}
