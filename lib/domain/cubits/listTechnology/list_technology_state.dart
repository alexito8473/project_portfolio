part of 'list_technology_cubit.dart';

class ListTechnologyState {
  final List<Knowledge> listFiltered;

  ListTechnologyState(
      {required this.listFiltered});
  factory ListTechnologyState.init() {
    return ListTechnologyState(listFiltered: Knowledge.values);
  }

  ListTechnologyState copyWitch(
          {
          required List<Knowledge>? listFiltered}) =>
      ListTechnologyState(
          listFiltered: listFiltered ?? this.listFiltered);
}
