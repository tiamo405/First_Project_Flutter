import '../constants/colors.dart';
import '../model/todo.dart';
import '../widgets/todo_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                    child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        'All ToDos',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                    for (ToDo todoo in todosList) 
                    ToDoItem(
                      todo: todoo,
                      onToDoChanged: _handleToDoChange,
                      onDeleteItem: (){},
                      )
                  ],
                ))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding:  EdgeInsets.symmetric(  
                      horizontal: 10,
                      vertical: 5
                    ),
                    decoration:
                        BoxDecoration(
                          color: Colors.white, 
                          boxShadow: const [ BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 10.0,
                                spreadRadius: 0.0),
                                ],
                          borderRadius:  BorderRadius.circular(10)
                    ),
                    child: TextField(  
                      decoration:  InputDecoration(  
                        hintText:  'Add a new todo item',
                        border:  InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(  
                  margin: EdgeInsets.only(  
                    bottom: 20,
                    right: 20,
                  ),
                   child:  ElevatedButton(  
                    child: Text(  
                      '+',
                      style:  TextStyle(fontSize: 40),
                    ),
                    onPressed: () {  },
                    style: ElevatedButton.styleFrom(  
                      backgroundColor: tdBlue,
                      minimumSize: Size(50, 50),
                      elevation: 10
                    ),
                   ),
                )
              ],),
          )
        ],
      ),
    );
  }

void _handleToDoChange( ToDo todo){  
  setState(() {
    todo.isDone = !todo.isDone;
  });
  
}

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
        ),
      ),
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      elevation: 0,
      backgroundColor: tdBGColor,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(
          Icons.menu,
          color: tdBlack,
          size: 30,
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/avatar.jpg'),
          ),
        ),
      ]),
    );
  }
}
