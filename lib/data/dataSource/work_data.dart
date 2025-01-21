import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/work.dart';
enum WorkData{
  NEXT_PORT,
  SPAIN_SUR;

  String getTitle({required BuildContext context}){
    switch(this){
      case WorkData.NEXT_PORT:
        return AppLocalizations.of(context)!.practices;
      case WorkData.SPAIN_SUR:
       return AppLocalizations.of(context)!.programmerSpain;
    }
  }

  List<String> getListWork({required BuildContext context}){
    switch(this){
      case WorkData.NEXT_PORT:
        return   [
          AppLocalizations.of(context)!.practicesNextPort1,
          AppLocalizations.of(context)!.practicesNextPort2,
          AppLocalizations.of(context)!.practicesNextPort3,
        ];
      case WorkData.SPAIN_SUR:
     return [
       AppLocalizations.of(context)!.programadorSpainSur1,
       AppLocalizations.of(context)!.programadorSpainSur2,
       AppLocalizations.of(context)!.programadorSpainSur3,
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