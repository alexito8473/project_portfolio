part of 'app_send_message_bloc.dart';

class AppSendMessageState {
  final bool sendMessage;
  final bool sentSuccessfully;
  final bool sentFinished;
  const AppSendMessageState(
      {required this.sendMessage,
      required this.sentSuccessfully,
      required this.sentFinished});

  AppSendMessageState copyWitch(
      {required bool? sendMessage,
      required bool? sentSuccessfully,
      required bool? sentFinished}) {
    return AppSendMessageState(
        sendMessage: sendMessage ?? this.sendMessage,
        sentSuccessfully: sentSuccessfully ?? this.sentSuccessfully,
        sentFinished: sentFinished ?? this.sentFinished);
  }
}

class AppSendMessageStateInit extends AppSendMessageState {
  AppSendMessageStateInit()
      : super(sendMessage: false, sentSuccessfully: false, sentFinished: false);
}
