import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:proyect_porfolio/data/models/Message.dart';

class SendMessageRepository {
  final String serviceId;
  final String templateId;
  final String secondTemplateId;
  final String userId;
  final Uri uri;

  SendMessageRepository._(
      {required this.serviceId,
      required this.templateId,
      required this.secondTemplateId,
      required this.userId,
      required this.uri});

  factory SendMessageRepository.init() => SendMessageRepository._(
      uri: Uri.parse(dotenv.env["URL_API"]!),
      serviceId: dotenv.env["EMAIL_SERVICE_ID"]!,
      templateId: dotenv.env["EMAIL_TEMPLATE_ID"]!,
      secondTemplateId: dotenv.env["EMAIL_SECOND_TEMPLATE_ID"]!,
      userId: dotenv.env["EMAIL_USER_ID"]!);

  get http => null;

  Future<Response> sendEmailToMe(Message message) async {
    return await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': message.name,
            'user_email': message.email,
            'user_subject': message.subject,
            'user_message': message.message
          }
        }));
  }

  void sendEmailToPerson(Message message) async {
    await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': serviceId,
          'template_id': secondTemplateId,
          'user_id': userId,
          'template_params': {
            'user_name': message.name,
            'user_email': message.email
          }
        }));
  }
}
