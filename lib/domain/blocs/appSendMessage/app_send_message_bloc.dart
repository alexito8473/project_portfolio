import 'package:bloc/bloc.dart';
import 'package:proyect_porfolio/data/models/message.dart';

import '../../repositories/send_message_repository.dart' deferred as send;

part 'app_send_message_event.dart';
part 'app_send_message_state.dart';
class AppSendMessageBloc
    extends Bloc<AppSendMessageEvent, AppSendMessageState> {

  AppSendMessageBloc()
      : super(AppSendMessageStateInit()) {
    on<AppSendMessageEvent>((event, emit) async {
      emit(state.copyWitch(
          sendMessage: true, sentSuccessfully: false, sentFinished: false));
      await send.loadLibrary();
      final sendMessage=send.SendMessageRepository.init();
      final response = await sendMessage.sendEmailToMe(event.message);
      if (response.statusCode == 200) {
        sendMessage.sendEmailToPerson(event.message);
        emit(state.copyWitch(
            sendMessage: false, sentSuccessfully: true, sentFinished: true));
      } else {
        emit(state.copyWitch(
            sendMessage: false, sentSuccessfully: false, sentFinished: true));
      }
    });
  }
}
