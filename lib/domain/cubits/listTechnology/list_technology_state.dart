part of 'list_technology_cubit.dart';

class ListTechnologyState {
  final List<Knowledge> listFiltered;
  final TypeLanguage currentTypeLanguage;
  ListTechnologyState(
      {required this.listFiltered, required this.currentTypeLanguage});
  factory ListTechnologyState.init() {
    return ListTechnologyState(
        listFiltered: Knowledge.values.where((element) => element.technology.typeLanguage==TypeLanguage.MOBILE,).toList(), currentTypeLanguage: TypeLanguage.MOBILE);
  }

  ListTechnologyState copyWitch(
          {required List<Knowledge>? listFiltered,
          required TypeLanguage? currentTypeLanguage}) =>
      ListTechnologyState(
          listFiltered: listFiltered ?? this.listFiltered,
          currentTypeLanguage: currentTypeLanguage ?? this.currentTypeLanguage);
}
