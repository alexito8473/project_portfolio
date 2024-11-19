import 'package:bloc/bloc.dart';

import '../../../data/dataSource/tecnology_data.dart';

part 'list_technology_state.dart';
class ListTechnologyCubit extends Cubit<ListTechnologyState> {
  ListTechnologyCubit() : super(ListTechnologyState.init());

  void changeListFiltered(TypeLanguage type) {
    emit(state.copyWitch(
        listFiltered: type == TypeLanguage.ALL
            ? Knowledge.values
            : Knowledge.values
                .where((element) => element.technology.typeLanguage==type)
                .toList()));
  }
}
