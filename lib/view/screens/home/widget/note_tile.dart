import 'package:flutter/material.dart';
import 'package:mind_pad/domain/entities/note_entities.dart';
import 'package:mind_pad/view/utils/theme.dart';

class NoteTile extends StatelessWidget {
  final NoteEntities note;
  final VoidCallback onEditPress;
  final VoidCallback onDeletePress;
  const NoteTile({
    super.key,
    required this.note,
    required this.onEditPress,
    required this.onDeletePress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onEditPress,
            child: Container(
              width: 35.0,
              height: 35.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 2.0,
                ),
              ),
              child: Icon(
                Icons.edit,
                color: CustomColors.primaryLight,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onDeletePress,
            child: Container(
              width: 35.0,
              height: 35.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 2.0,
                ),
              ),
              child: Icon(
                Icons.delete,
                color: CustomColors.primaryLight,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: CustomColors.primary.withOpacity(0.7),
      title: Text(
        note.title!,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Colors.white, fontSize: 20),
      ),
      subtitle: Text(
        note.description!,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
