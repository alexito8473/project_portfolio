import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../models/Message.dart';
part 'app_send_message_event.dart';
part 'app_send_message_state.dart';

class AppSendMessageBloc
    extends Bloc<AppSendMessageEvent, AppSendMessageState> {
  AppSendMessageBloc() : super(AppSendMessageState.init()) {
    on<AppSendMessageEvent>((event, emit) async {
      emit(state.copyWitch(
          serviceId: state.serviceId,
          templateId: state.templateId,
          secondTemplateId: state.secondTemplateId,
          userId: state.userId,
          uri: state.uri,
          sendMessage: true,
          sentSuccessfully: false,
          sentFinished: false));
      final response = await http.post(state.uri,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'service_id': state.serviceId,
            'template_id': state.templateId,
            'user_id': state.userId,
            'template_params': {
              'user_name': event.message.name,
              'user_email': event.message.email,
              'user_subject': event.message.subject,
              'user_message': event.message.message
            }
          }));
      if (response.statusCode == 200) {
        await http.post(state.uri,
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'service_id': state.serviceId,
              'template_id': state.secondTemplateId,
              'user_id': state.userId,
              'template_params': {
                'user_name': event.message.name,
                'user_email': event.message.email
              }
            }));
        emit(state.copyWitch(
            serviceId: state.serviceId,
            templateId: state.templateId,
            secondTemplateId: state.secondTemplateId,
            userId: state.userId,
            uri: state.uri,
            sendMessage: false,
            sentSuccessfully: true,
            sentFinished: true));
      } else {
        emit(state.copyWitch(
            serviceId: state.serviceId,
            templateId: state.templateId,
            secondTemplateId: state.secondTemplateId,
            userId: state.userId,
            uri: state.uri,
            sendMessage: false,
            sentSuccessfully: false,
            sentFinished: true));
      }
    });
  }
}
