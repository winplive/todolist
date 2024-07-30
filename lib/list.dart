
import 'package:hive/hive.dart';
//import 'package:uuid/uuid.dart';
part 'list.g.dart';

//var uuid = const Uuid();

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String task;
  @HiveField(2)
  final int isCompleted;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final String startTime;
  @HiveField(5)
  final String endTime;

  Task(
      {
        required this.title,
        required this.task,
        required this.isCompleted,
        required this.date,
        required this.startTime,
        required this.endTime,
      }
      );
}