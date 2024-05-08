
int todoIndex = 0;

class Todo {
  int id;

  String title;

  @override
  String toString() {
    return 'Todo{id: $id, title: $title}';
  }

  Todo({
    required this.id,
    required this.title,
  });

  static Todo newDefaultTodo(){
    todoIndex++;
    return Todo(id: todoIndex, title: 'Item $todoIndex');
  }
}