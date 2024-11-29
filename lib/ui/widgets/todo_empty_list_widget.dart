import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/constants.dart';

class TodoListEmptyWidget extends StatelessWidget {
  const TodoListEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No tasks yet',
          style: GoogleFonts.inter(
            fontSize: 18,
            color: AppColors.textSecondaryColor,
          ),
        ),
        Text(
          'Add a new task to get started',
          style: GoogleFonts.inter(
            color: AppColors.textSecondaryColor,
          ),
        ),
      ],
    ));
  }
}
