import 'package:flutter/material.dart';
import 'package:todo_app/task.dart';

class AddTodoScreen extends StatefulWidget {
  
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          AppBar(
            title:const Center(
            child:  Text(
              'To Do',style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              ),
              ),
          ) ,
            backgroundColor: Colors.pink,
            ),
          Padding(
            padding:const  EdgeInsets.all(10.0),
            child:   SizedBox(
                height: 50,
                width: 300,
                child:   TextField(
                  controller: titleController,
                  decoration:const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title'),
                    ),
              ),
          ),
                     Padding(
            padding: const EdgeInsets.all(10.0),
            child:   SizedBox(
                height: 50,
                width: 300,
                child:   TextField(
                    controller: descriptionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description'),
                    ),
              ),
          ),
          TextButton(
          onPressed: () {
            final title = titleController.text;
            final description = descriptionController.text;
              Navigator.of(context).pop(Task(title:title , description:description),
              );
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),),
          child: const Text('Add',style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold),
              ),
        ),
        ],
      ),
    );
  }
}