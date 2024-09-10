import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:proyect_porfolio/models/Message.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SendMessage {
  static SendMessage? _instance;

  late String serviceId;
  late String templateId;
  late String secondTemplateId;
  late String userId;
  late Uri uri;

  SendMessage.init() {
    serviceId = dotenv.env["EMAIL_SERVICE_ID"]!;
    templateId = dotenv.env["EMAIL_TEMPLATE_ID"]!;
    secondTemplateId = dotenv.env["EMAIL_SECOND_TEMPLATE_ID"]!;
    userId = dotenv.env["EMAIL_USER_ID"]!;
    uri = Uri.parse(dotenv.env["URL_API"]!);
  }
  static SendMessage? getInstance() {
    return _instance ??= SendMessage.init();
  }

  Future<bool> sendEmail(Message message) async {
    final response = await http.post(uri,
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
    if (response.statusCode == 200) {
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
      return true;
    } else {
      return false;
    }
  }
}
