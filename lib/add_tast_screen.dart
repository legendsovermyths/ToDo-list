import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/Task.dart';
import 'task_data.dart';
class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    return Container(
      color: Color(0XFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Center(child: Text("Add Task",style: TextStyle(fontSize: 30,color: Colors.lightBlueAccent),)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: myController,
                  textAlign: TextAlign.center,
                  autofocus: true,
                  style: TextStyle(fontSize: 19),
                ),
              ),
              SizedBox(height: 25,),
              FlatButton(
                onPressed: (){
                  Provider.of<TaskData>(context,listen: false).addtask(myController.text);
                  Navigator.pop(context);
                },
                disabledColor: Colors.lightBlueAccent,
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 20),),
                ),

              )


            ],
          ),
        ),
      ),

    );
  }
}
