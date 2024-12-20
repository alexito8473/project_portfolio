part of 'list_technology_cubit.dart';

class ListTechnologyState {
  final List<Knowledge> listFiltered;
  final int lengthListLate;
  final TypeLanguage currentTypeLanguage;
  ListTechnologyState(
      {required this.lengthListLate, required this.listFiltered, required this.currentTypeLanguage});
  factory ListTechnologyState.init() {
    return ListTechnologyState(
        lengthListLate:Knowledge.values.length,
        listFiltered: Knowledge.values, currentTypeLanguage: TypeLanguage.ALL);
  }

  ListTechnologyState copyWitch(
          { List<Knowledge>? listFiltered,
           TypeLanguage? currentTypeLanguage, int? lengthListLate}) =>
      ListTechnologyState(
        lengthListLate: lengthListLate??this.lengthListLate,
          listFiltered: listFiltered ?? this.listFiltered,
          currentTypeLanguage: currentTypeLanguage ?? this.currentTypeLanguage);
}
