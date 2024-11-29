import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/widgets/todo_empty_list_widget.dart';

import '../../core/constants.dart';
import '../../providers/todo_provider.dart';
import '../widgets/todo_add_edit_dialog.dart';
import '../widgets/todo_tile_widget.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          return todoProvider.todos.isEmpty
              ? const TodoListEmptyWidget()
              : ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    final todo = todoProvider.todos.values.elementAt(0);
                    return TodoItemWidget(todo: todo);
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context, builder: (context) => const TodoDialog());
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'Add Task',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
