import 'package:bloc/bloc.dart';

import '../../../data/dataSource/tecnology_data.dart';

part 'list_technology_state.dart';

class ListTechnologyCubit extends Cubit<ListTechnologyState> {
  ListTechnologyCubit() : super(ListTechnologyState.init());
  int _filterRequestId = 0;

  void changeListFiltered(TypeLanguage type) {
    final requestId = ++_filterRequestId;
    List<Knowledge> listTypes = List.of(type == TypeLanguage.ALL
        ? Knowledge.values
        : Knowledge.values
        .where((element) => element.technology.typeLanguage == type)
        .toList());

    emit(state.copyWitch(
        lengthListLate: 0,
        listFiltered: listTypes,
        currentTypeLanguage: type));
    Future<void>.delayed(const Duration(milliseconds: 100), () {
      if (isClosed || requestId != _filterRequestId) return;
      emit(state.copyWitch(lengthListLate: listTypes.length));
    });
  }
}
