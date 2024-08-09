import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/Technology.dart';

part 'list_technology_event.dart';
part 'list_technology_state.dart';

class ListTechnologyBloc
    extends Bloc<ListTechnologyEvent, ListTechnologyState> {
  ListTechnologyBloc({
    required listTechnologyMobile,
    required listTechnologyBackend,
    required listTechnologyFrontend,
    required listTechnologyLearning,
    required listTechnologyTools,
  }) : super(ListTechnologyState(
            listTechnologyMobile: listTechnologyMobile,
            listTechnologyBackend: listTechnologyBackend,
            listTechnologyFrontend: listTechnologyFrontend,
            listTechnologyLearning: listTechnologyLearning,
            listTechnologyTools: listTechnologyTools)) {
    on<ListTechnologyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
