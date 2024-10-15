import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFuction;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFuction});

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFuction,
            icon: Icons.delete,
            backgroundColor: const Color.fromARGB(255, 177, 34, 34),
            borderRadius: BorderRadius.circular(20),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color.fromARGB(219, 194, 76, 101),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Color.fromARGB(255, 88, 16, 44),
                checkColor: Colors.white,
              ),
              Text(
                taskName,
                style: GoogleFonts.oxygen(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    textStyle: TextStyle(
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
