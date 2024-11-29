import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../core/constants.dart';
import '../../models/todo_model.dart';
import '../../providers/todo_provider.dart';
import 'todo_add_edit_dialog.dart';

class TodoItemDialog extends StatelessWidget {
  final TodoModel todo;

  const TodoItemDialog({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.title,
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              todo.description.isEmpty
                  ? 'No description provided.'
                  : todo.description,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: AppColors.textSecondaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Created on: ${todo.createdAt.toLocal().toString().split(' ')[0]}',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppColors.textSecondaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (context) => TodoDialog(todo: todo),
                    );
                  },
                  icon: const Icon(Icons.edit, size: 18),
                  label: const Text('Edit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Task'),
                      content: const Text(
                        'Are you sure you want to delete this task?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final provider = context.read<TodoProvider>();
                            provider.deleteTodo(todo.id);
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  ),
                  icon: const Icon(Icons.delete, size: 18),
                  label: const Text('Delete'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
