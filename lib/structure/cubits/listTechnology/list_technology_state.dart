part of 'list_technology_cubit.dart';

class ListTechnologyState {
  final List<Technology> listTechnologyMobile;
  final List<Technology> listTechnologyBackend;
  final List<Technology> listTechnologyFrontend;
  final List<Technology> listTechnologyLearning;
  final List<Technology> listTechnologyTools;
  final List<Technology> listTechnologyServers;
  ListTechnologyState(
      {required this.listTechnologyMobile,
      required this.listTechnologyBackend,
      required this.listTechnologyFrontend,
      required this.listTechnologyLearning,
      required this.listTechnologyTools,
      required this.listTechnologyServers});
  factory ListTechnologyState.init() {
    List<Technology> allTechnology = createListTechnology();
    return ListTechnologyState(
        listTechnologyMobile: allTechnology
            .where((element) => element.typeLanguage == TypeLanguage.MOBILE)
            .toList(),
        listTechnologyBackend: allTechnology
            .where((element) => element.typeLanguage == TypeLanguage.BACKEND)
            .toList(),
        listTechnologyFrontend: allTechnology
            .where((element) => element.typeLanguage == TypeLanguage.MOBILE)
            .toList(),
        listTechnologyLearning: allTechnology
            .where((element) => element.typeLanguage == TypeLanguage.LEARNING)
            .toList(),
        listTechnologyTools: allTechnology
            .where((element) => element.typeLanguage == TypeLanguage.TOOLS)
            .toList(),
        listTechnologyServers: allTechnology
            .where((element) => element.typeLanguage == TypeLanguage.SERVERS)
            .toList());
  }
}
