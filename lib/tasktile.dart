import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'task_data.dart';

class Tasklist extends StatefulWidget {

  @override
  _TasklistState createState() => _TasklistState();
}

class _TasklistState extends State<Tasklist> {


  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemBuilder: (context, index) {
        return
          Tasktile(
              taskTitle: Provider.of<TaskData>(context).tasks[index].name,
              ischecked: Provider.of<TaskData>(context).tasks[index].isDone,
          checkboxcallback:(newValue){
                Provider.of<TaskData>(context,listen: false).checktask(index);

        },
        presscallback: (){
                Provider.of<TaskData>(context,listen: false).deletetask(index);
        },
        );
      },
      itemCount: Provider.of<TaskData>(context).tasks.length,
    );
  }
}

class Tasktile extends StatelessWidget {
  final bool ischecked;
  final String taskTitle;
  final Function checkboxcallback;
  final Function presscallback;
  Tasktile({this.ischecked, this.taskTitle,this.checkboxcallback,this.presscallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: ischecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.blueAccent,
        value: ischecked,
        onChanged: checkboxcallback,
      ),
      onLongPress: presscallback,
    );
  }
}
