import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_pad/domain/entities/note_entities.dart';
import 'package:mind_pad/view/screens/add%20note%20screen/add_note_cubit.dart';
import 'package:mind_pad/view/screens/add%20note%20screen/add_note_initial_params.dart';
import 'package:mind_pad/view/screens/add%20note%20screen/add_note_state.dart';
import 'package:mind_pad/view/widgets/custom_button.dart';
import 'package:mind_pad/view/widgets/custom_textfield.dart';

class AddNoteScreen extends StatefulWidget {
  final AddNoteInitialParams initialParams;
  const AddNoteScreen({super.key, required this.initialParams});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  late AddNoteCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<AddNoteCubit>(context);
    initialization();
  }

  initialization() {
    if (widget.initialParams.isEditMode && widget.initialParams.note != null) {
      titleController.text = widget.initialParams.note!.title!;
      descriptionController.text = widget.initialParams.note!.description!;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          widget.initialParams.isEditMode ? "Edit Note" : "Add a Note",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: height * 0.015),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Title",
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            CustomTextField(
              enabled: true,
              type: TextInputType.name,
              controller: titleController,
              hintText: "Enter Title Here",
              readOnly: false,
            ),
            SizedBox(height: height * 0.01),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Description"),
              ],
            ),
            SizedBox(height: height * 0.01),
            CustomTextField(
              enabled: true,
              type: TextInputType.name,
              controller: descriptionController,
              hintText: "Enter Description Here",
              readOnly: false,
              maxLines: 3,
            ),
            SizedBox(height: height * 0.02),
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                state is AddNoteState;
                return CustomButton(
                  height: 50,
                  title: widget.initialParams.isEditMode ? 'Update' : 'Add',
                  onTap: () {
                    if (widget.initialParams.isEditMode) {
                      // update function
                      context.read<AddNoteCubit>().updateNote(
                            widget.initialParams.note!.id,
                            NoteEntities(
                              id: widget.initialParams.note!.id,
                              title: titleController.text,
                              description: descriptionController.text,
                            ),
                          );
                    } else {
                      // add function
                      context.read<AddNoteCubit>().addNote(
                            NoteEntities(
                              id: '',
                              title: titleController.text,
                              description: descriptionController.text,
                            ),
                          );
                    }
                    Navigator.of(context).pop();
                  },
                  loading: false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
