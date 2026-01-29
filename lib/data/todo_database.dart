import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_v1/Pages/todo_list.dart';

class ToDoDataBase{

List toDoList = [];

    //reference the box
    final _myBox = Hive.box('myBox');

    //run this method for first time use
    void createInitialData(){

      toDoList = [
        ["Make Tutorial", false],
        ["Do Exercise", false],
      ];
    }

    //load data from database
    void loadData(){
toDoList= _myBox.get("TODOLIST");
    }

    //update database
void updateDatabase(){
  _myBox.put("TODOLIST", TodoList);
}

}