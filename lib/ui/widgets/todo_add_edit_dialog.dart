import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../core/constants.dart';
import '../../models/todo_model.dart';
import '../../providers/todo_provider.dart';

class TodoDialog extends StatefulWidget {
  final TodoModel? todo;

  const TodoDialog({super.key, this.todo});

  @override
  TodoDialogState createState() => TodoDialogState();
}

class TodoDialogState extends State<TodoDialog> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late bool _isEditMode;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _isEditMode = widget.todo != null;
    _titleController = TextEditingController(
      text: _isEditMode ? widget.todo!.title : '',
    );

    _descriptionController = TextEditingController(
      text: _isEditMode ? widget.todo!.description : '',
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitTodo() {
    if (_formKey.currentState!.validate()) {
      final provider = context.read<TodoProvider>();

      if (_isEditMode) {
        provider.updateTodo(
          widget.todo!.id,
          _descriptionController.text,
          title: _titleController.text,
        );
      } else {
        provider.addTodo(
          _titleController.text.trim(),
          _descriptionController.text.trim(),
        );
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _isEditMode ? 'Edit Task' : 'Create New Task',
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Task Title',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.textSecondaryColor,
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _titleController,
                autofocus: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter task title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: GoogleFonts.inter(),
              ),
              const SizedBox(height: 20),
              Text(
                'Description (Optional)',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.textSecondaryColor,
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Enter task description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: GoogleFonts.inter(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.inter(
                        color: AppColors.textSecondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _submitTodo,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      _isEditMode ? 'Update Task' : 'Add Task',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
