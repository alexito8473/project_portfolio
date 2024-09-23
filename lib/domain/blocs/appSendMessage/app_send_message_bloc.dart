import 'package:bloc/bloc.dart';
import 'package:proyect_porfolio/data/models/message.dart';

import '../../repositories/send_message_repository.dart';

part 'app_send_message_event.dart';
part 'app_send_message_state.dart';
class AppSendMessageBloc
    extends Bloc<AppSendMessageEvent, AppSendMessageState> {
  final SendMessageRepository sendMessageRepository;

  AppSendMessageBloc({required this.sendMessageRepository})
      : super(AppSendMessageStateInit()) {
    on<AppSendMessageEvent>((event, emit) async {
      emit(state.copyWitch(
          sendMessage: true, sentSuccessfully: false, sentFinished: false));

      final response = await sendMessageRepository.sendEmailToMe(event.message);

      if (response.statusCode == 200) {
        sendMessageRepository.sendEmailToPerson(event.message);
        emit(state.copyWitch(
            sendMessage: false, sentSuccessfully: true, sentFinished: true));
      } else {
        emit(state.copyWitch(
            sendMessage: false, sentSuccessfully: false, sentFinished: true));
      }
    });
  }
}
