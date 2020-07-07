import 'package:flutter/foundation.dart';
import 'Task.dart';
class TaskData extends ChangeNotifier{
  List<Task> tasks = [
    

  ];
  void addtask(String value){
    tasks.add(Task(name: value));
    notifyListeners();
  }
  void checktask(int index){
    tasks[index].toggleDone();
    notifyListeners();
  }

  void deletetask(int index) {
     tasks.removeAt(index);
     notifyListeners();
   }
}