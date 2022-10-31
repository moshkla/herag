abstract class ChatStates {}

class AppGetAllUsersLoadingState extends ChatStates {}

class AppGetAllUsersSuccessState extends ChatStates {}

class AppGetAllUsersErrorState extends ChatStates {
  final String error;

  AppGetAllUsersErrorState(this.error);
}

//chats
class InitialState extends ChatStates {}

class AppSendMessageSuccessState extends ChatStates {}

class AppSendMessageErrorState extends ChatStates {}

class AppGetMessagesSuccessState extends ChatStates {}
