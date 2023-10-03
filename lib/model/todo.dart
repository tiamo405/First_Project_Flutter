class ToDo{
  String? id;
  String? todoText;
  bool isDone;
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false
  });


  static List<ToDo> todoList(){
    return [
    ToDo(id: '01', todoText: 'danh rang', isDone: true),
    ToDo(id: '02', todoText: 'luot facebook', isDone: true),
    ToDo(id: '03', todoText: 'an sang', isDone:  true),
    ToDo(id: '04', todoText: 'check email'),
    ToDo(id: '05', todoText: 'team Meeting'),
    ToDo(id: '06', todoText: 'Work on mobile apps for 2 hour'),
    ToDo(id: '07', todoText: 'Drink milk'),

    ];
  }
}