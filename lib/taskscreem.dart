import 'package:flutter/material.dart';
import 'tasktile.dart';
import 'add_tast_screen.dart';
import 'Task.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';
class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          showModalBottomSheet(context: context, builder:(context)=>AddTaskScreen((newtasktitle){
//            setState(() {
//              tasks.add(Task(name: newtasktitle));
//            });

          }));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.lightBlueAccent,
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:60,right:20,left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(radius: 30,backgroundColor: Colors.white,child: Icon(Icons.list,color: Colors.lightBlueAccent,size: 30,)),
                SizedBox(height: 30,),
                Text("Checklist",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w700),),
                Text("${Provider.of<TaskData>(context).tasks.length} tasks",style: TextStyle(color: Colors.white,fontSize: 18),),
                SizedBox(height: 50,)

              ],
            ),
          ),
          Expanded(child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
              child: Tasklist(),))
        ],
      ),
    );
  }
}


