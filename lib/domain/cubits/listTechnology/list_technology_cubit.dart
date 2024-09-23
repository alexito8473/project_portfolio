import 'package:bloc/bloc.dart';
import 'package:proyect_porfolio/data/models/technology.dart';

import '../../../data/dataSource/tecnology_data.dart';

part 'list_technology_state.dart';
class ListTechnologyCubit extends Cubit<ListTechnologyState> {
  ListTechnologyCubit() : super(ListTechnologyState.init());

  void changeListFiltered(TypeLanguage type) {
    emit(state.copyWitch(
        listTechnology: state.listTechnology,
        listFiltered: type == TypeLanguage.ALL
            ? state.listTechnology
            : state.listTechnology
                .where((element) => element.typeLanguage == type)
                .toList()));
  }
}
