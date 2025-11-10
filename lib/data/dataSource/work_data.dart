import '../../l10n/app_localizations.dart';
import '../models/work.dart';
enum WorkData{
  NEXT_PORT,
  SPAIN_SUR;

  String getTitle({required AppLocalizations locale}){
    switch(this){
      case WorkData.NEXT_PORT:
        return locale.practices;
      case WorkData.SPAIN_SUR:
       return locale.programmerSpain;
    }
  }

  List<String> getListWork({required AppLocalizations locale}){
    switch(this){
      case WorkData.NEXT_PORT:
        return   [
          locale.practicesNextPort1,
          locale.practicesNextPort2,
          locale.practicesNextPort3,
        ];
      case WorkData.SPAIN_SUR:
     return [
       locale.programadorSpainSur1,
       locale.programadorSpainSur2,
       locale.programadorSpainSur3,
     ];
    }
  }
  static List<Work> generateWorks(){
    return [
      Work(initDay: DateTime.utc(2025,1),title: "SpainSur",workData: WorkData.SPAIN_SUR),
      Work(initDay: DateTime.utc(2024,4),finishDay:  DateTime.utc(2024,6),title: "NextPort AI",workData: WorkData.NEXT_PORT)
    ];
  }
}