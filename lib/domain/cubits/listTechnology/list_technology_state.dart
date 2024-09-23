part of 'list_technology_cubit.dart';

class ListTechnologyState {
  final List<Technology> listTechnology;
  final List<Technology> listFiltered;

  ListTechnologyState(
      {required this.listTechnology, required this.listFiltered});

  factory ListTechnologyState.init() {
    List<Technology> listTechnology = createListTechnology();
    return ListTechnologyState(
        listTechnology: listTechnology, listFiltered: listTechnology);
  }

  ListTechnologyState copyWitch(
          {required List<Technology>? listTechnology,
          required List<Technology>? listFiltered}) =>
      ListTechnologyState(
          listTechnology: listTechnology ?? this.listTechnology,
          listFiltered: listFiltered ?? this.listFiltered);
}
