part of 'app_send_message_bloc.dart';

class AppSendMessageState {
  final String serviceId;
  final String templateId;
  final String secondTemplateId;
  final String userId;
  final Uri uri;
  final bool sendMessage;
  final bool sentSuccessfully;
  final bool sentFinished;
  const AppSendMessageState(
      {required this.serviceId,
      required this.templateId,
      required this.secondTemplateId,
      required this.userId,
      required this.uri,
      required this.sendMessage,
      required this.sentSuccessfully,
      required this.sentFinished});
  factory AppSendMessageState.init() {
    return AppSendMessageState(
        uri: Uri.parse(dotenv.env["URL_API"]!),
        serviceId: dotenv.env["EMAIL_SERVICE_ID"]!,
        templateId: dotenv.env["EMAIL_TEMPLATE_ID"]!,
        secondTemplateId: dotenv.env["EMAIL_SECOND_TEMPLATE_ID"]!,
        userId: dotenv.env["EMAIL_USER_ID"]!,
        sendMessage: false,
        sentSuccessfully: false,
        sentFinished: false);
  }
  AppSendMessageState copyWitch(
      {required String? serviceId,
      required String? templateId,
      required String? secondTemplateId,
      required String? userId,
      required Uri? uri,
      required bool? sendMessage,
      required bool? sentSuccessfully,
      required bool? sentFinished}) {
    return AppSendMessageState(
        uri: uri ?? this.uri,
        serviceId: serviceId ?? this.serviceId,
        templateId: templateId ?? this.templateId,
        secondTemplateId: secondTemplateId ?? this.secondTemplateId,
        userId: userId ?? this.userId,
        sendMessage: sendMessage ?? this.sendMessage,
        sentSuccessfully: sentSuccessfully ?? this.sentSuccessfully,
        sentFinished: sentFinished ?? this.sentFinished);
  }
}
