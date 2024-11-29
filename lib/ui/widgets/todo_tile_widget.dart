import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/widgets/todo_item_dialog.dart';

import '../../core/constants.dart';
import '../../models/todo_model.dart';
import '../../providers/todo_provider.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoModel todo;

  const TodoItemWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => TodoItemDialog(todo: todo),
          );
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Checkbox(
          activeColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          value: todo.isCompleted,
          onChanged: (_) {
            context.read<TodoProvider>().toggleTodoStatus(todo.id);
          },
        ),
        title: Text(
          todo.title,
          style: GoogleFonts.inter(
            color: todo.isCompleted
                ? AppColors.textSecondaryColor
                : AppColors.textPrimaryColor,
            decoration: todo.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            fontSize: 16,
            fontWeight: todo.isCompleted ? FontWeight.normal : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
