

import 'package:flutter/material.dart';
import 'package:todo_app/presentation/addtodo_screen.dart';
import 'package:todo_app/task.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() =>  _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<Task> tasks = [];

  void addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  void removeTask(String title) {
    setState(() {
      tasks.removeWhere((task) => task.title == title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(
          child: Text('Todo List',style: TextStyle(
              color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
               ),
        ),
             backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final todoItem = tasks[index];
          return ListTile(
            title: Text(todoItem.title,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold
            ),
            ),
            subtitle: Text(todoItem.description),
            trailing: IconButton(
              icon:const Icon(Icons.delete),
              onPressed: () => removeTask(todoItem.title),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        
        onPressed: ()async  {
          final result = await showDialog(
            context: context,
            builder: (context) => const AddTodoScreen(),
          );
          if (result != null) {
            addTask(result);
          }
        },
        child: const Icon(Icons.add,color: Colors.white,),
    ),
    );
  }
}