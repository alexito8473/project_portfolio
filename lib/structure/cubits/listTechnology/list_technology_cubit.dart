import 'package:bloc/bloc.dart';

import '../../../models/Technology.dart';

part 'list_technology_state.dart';

class ListTechnologyCubit extends Cubit<ListTechnologyState> {
  ListTechnologyCubit({
    required listTechnologyMobile,
    required listTechnologyBackend,
    required listTechnologyFrontend,
    required listTechnologyLearning,
    required listTechnologyTools,
    required listTechnologyServers,
  }) : super(ListTechnologyState(
            listTechnologyMobile: listTechnologyMobile,
            listTechnologyBackend: listTechnologyBackend,
            listTechnologyFrontend: listTechnologyFrontend,
            listTechnologyLearning: listTechnologyLearning,
            listTechnologyTools: listTechnologyTools,
            listTechnologyServers: listTechnologyServers));

  List<Technology> getTypeLanguageList(TypeLanguage typeLanguage) {
    switch (typeLanguage) {
      case TypeLanguage.BACKEND:
        return state.listTechnologyBackend;
      case TypeLanguage.FRONTEND:
        return state.listTechnologyFrontend;
      case TypeLanguage.MOBILE:
        return state.listTechnologyMobile;
      case TypeLanguage.TOOLS:
        return state.listTechnologyTools;
      case TypeLanguage.LEARNING:
        return state.listTechnologyLearning;
      case TypeLanguage.SERVERS:
        return state.listTechnologyServers;
    }
  }
}
