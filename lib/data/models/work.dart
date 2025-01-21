import 'package:proyect_porfolio/data/dataSource/work_data.dart';

class Work{
  final DateTime initDay;
  final DateTime? finishDay;
  final WorkData workData;
  final String title;
  const Work( {required this.initDay, this.finishDay,required this.workData,required this.title});
}